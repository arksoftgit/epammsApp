<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wSPLDMarketingSection --%>

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
      // EditBox: Subtitle
      nRC = mSPLDef.cursor( "SPLD_MarketingSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Subtitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Subtitle", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_MarketingSection" ).setAttribute( "Subtitle", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Subtitle", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridMarketing
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "SPLD_MarketingStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "SPLD_MarketingStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "Select" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Select", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingStatement" ).setAttribute( "Selected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingStatement" ).setAttribute( "Selected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "SPLD_MarketingStatement" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: AreasOfUse
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "MarketingAreasOfUse" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MarketingAreasOfUse" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_AreasOfUse" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_AreasOfUse", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "MarketingAreasOfUse" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: ApplTypes
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "MarketingAppType" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MarketingAppType" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_ApplType" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_ApplType", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "MarketingAppType" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Fungi
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "MarketingFungi" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MarketingFungi" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_Fungi" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_Fungi", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "MarketingFungi" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Bacteria
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "MarketingBacteria" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MarketingBacteria" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_Bacteria" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_Bacteria", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "MarketingBacteria" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Surfaces
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "MarketingSurface" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MarketingSurface" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_Surface" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_Surface", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "MarketingSurface" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Viruses
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "MarketingViruses" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MarketingViruses" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_Viruses" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_Viruses", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", strMapValue );
               else
                  vGridTmp.cursor( "SPLD_MarketingUsage" ).setAttribute( "wkSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "MarketingViruses" ).setNextContinue( );
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

if ( strLastWindow.equals("wSPLDMarketingSection") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSPLD_Dialog wSPLD = new wSPLD_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSPLDMarketingSection strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSPLDMarketingSection LastWindow *** " + strLastWindow );
task.log().info("*** wSPLDMarketingSection LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.AcceptMarketingSect" );
      try
      {
         nOptRC = wSPLD.AcceptMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wSPLDMarketingSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.CancelMarketingSect" );
      try
      {
         nOptRC = wSPLD.CancelMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wSPLDMarketingSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedApplTypes" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedAreasOfUse" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedBacteria" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedFungi" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedSurfaces" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedViruses" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeleteMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.SelectMarketingSectForDelete" );
      try
      {
         nOptRC = wSPLD.SelectMarketingSectForDelete( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SelectMarketingSectForDelete: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wSPLDDeleteMarketingSection.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveMarketingStmtDown" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSPLDef;
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSPLDef.cursor( "SPLD_MarketingStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDef.cursor( "SPLD_MarketingStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDef.cursor( "SPLD_MarketingStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDef.cursor( "SPLD_MarketingStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.MoveMarketingStmtDown" );
      try
      {
         nOptRC = wSPLD.MoveMarketingStmtDown( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveMarketingStmtDown: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveMarketingStmtUp" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSPLDef;
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSPLDef.cursor( "SPLD_MarketingStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDef.cursor( "SPLD_MarketingStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDef.cursor( "SPLD_MarketingStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDef.cursor( "SPLD_MarketingStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.MoveMarketingStmtUp" );
      try
      {
         nOptRC = wSPLD.MoveMarketingStmtUp( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveMarketingStmtUp: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveShowNextMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.SaveShowNextMarketingSect" );
      try
      {
         nOptRC = wSPLD.SaveShowNextMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveShowNextMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveShowPrevMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.SaveShowPrevMarketingSect" );
      try
      {
         nOptRC = wSPLD.SaveShowPrevMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveShowPrevMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllApplTypes" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllAreasOfUse" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllBacteria" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllFungi" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllSurfaces" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllViruses" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectMarketingStmtForUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.SelectMarketingStmtForUpdate" );
      try
      {
         nOptRC = wSPLD.SelectMarketingStmtForUpdate( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SelectMarketingStmtForUpdate: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wSPLDMarketingStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.AcceptMarketingSect" );
      try
      {
         nOptRC = wSPLD.AcceptMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wSPLDMarketingSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveShowNextMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.SaveShowNextMarketingSect" );
      try
      {
         nOptRC = wSPLD.SaveShowNextMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveShowNextMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveShowPrevMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.SaveShowPrevMarketingSect" );
      try
      {
         nOptRC = wSPLD.SaveShowPrevMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveShowPrevMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.CancelMarketingSect" );
      try
      {
         nOptRC = wSPLD.CancelMarketingSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelMarketingSect: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wSPLDMarketingSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.ProductManagement" );
      try
      {
         nOptRC = wStartUp.ProductManagement( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation ProductManagement: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpAdminListPrimaryRegistrants.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.SubregistrantManagement" );
      try
      {
         nOptRC = wStartUp.SubregistrantManagement( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SubregistrantManagement: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpAdminListSubregistrants.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTrackingNotificationCompliance" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.TrackingNotificationCompliance" );
      try
      {
         nOptRC = wStartUp.TrackingNotificationCompliance( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation TrackingNotificationCompliance: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mStateRegistrations" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.StateRegistrations" );
      try
      {
         nOptRC = wStartUp.StateRegistrations( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation StateRegistrations: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mMarketingFulfillment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.MarketingFulfillment" );
      try
      {
         nOptRC = wStartUp.MarketingFulfillment( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MarketingFulfillment: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mWebDevelopment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.WebDevelopment" );
      try
      {
         nOptRC = wStartUp.WebDevelopment( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation WebDevelopment: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mAdministration" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
      try
      {
         nOptRC = wStartUp.PrimaryRegistrantCompanySetup( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation PrimaryRegistrantCompanySetup: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpAdminUpdatePrimaryRegistrant.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.ProcessLogin" );
      try
      {
         nOptRC = wStartUp.ProcessLogin( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation ProcessLogin: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpUserLogin.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTemplate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wStartUp.Template" );
      try
      {
         nOptRC = wStartUp.Template( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation Template: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLDMarketingSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wTemplDTemplateList.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSPLDMarketingSection" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSPLDMarketingSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDMarketingSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSPLDMarketingSection.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSPLDMarketingSection.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDMarketingSection.jsp", "wSPLD.InitMarketingSectForDelete" );
   nOptRC = wSPLD.InitMarketingSectForDelete( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wSPLDMarketingSection.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSPLD" +
                         "&OperationName=" + "InitMarketingSectForDelete";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSPLD", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

%>

<html>
<head>

<title>Marketing Section</title>

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
<script language="JavaScript" type="text/javascript" src="./js/tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSPLDMarketingSection.js"></script>

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
       <li><a href="#"  onclick="smAcceptMarketingSect( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveShowNext" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveShowNextMarketingSect( )">Save/Show Next</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveShowPrev" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveShowPrevMarketingSect( )">Save/Show Previous</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelMarketingSect( )">Cancel and Return</a></li>
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


<form name="wSPLDMarketingSection" id="wSPLDMarketingSection" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lPrimReg = null;
   View mMasLC = null;
   View mMasProd = null;
   View mPrimReg = null;
   View mSubLC = null;
   View mSPLDef = null;
   View lSPLDLST = null;
   View mTempl = null;
   View lTemplLST = null;
   View lSubLCA = null;
   View mSubProd = null;
   View mSubreg = null;
   View wMLCList = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSPLD", "MarketingSection" );
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
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* BreadCrumb: */ %>
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingSection:GroupBox */ %>

<div id="MarketingSection" name="MarketingSection" style="width:732px;height:124px;float:left;">  <!-- MarketingSection --> 

<div  id="MarketingSection" name="MarketingSection" >Marketing Section</div>

 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* MarketingTitle::Text */ %>

<span  id="MarketingTitle:" name="MarketingTitle:" style="width:130px;height:16px;">Marketing Title:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* MarketingTitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "MarketingTitle", strError );
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
         task.log( ).debug( "Invalid View: " + "MarketingTitle" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_MarketingSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SPLD_MarketingSection" ).getStringFromAttribute( "Title", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on MarketingTitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl MarketingTitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SPLD_MarketingSection.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SPLD_MarketingSection" );
      }
   }
%>

<input name="MarketingTitle" id="MarketingTitle"  disabled style="width:560px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Subtitle::Text */ %>

<span  id="Subtitle:" name="Subtitle:" style="width:130px;height:16px;">Subtitle:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Subtitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Subtitle", strError );
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
         task.log( ).debug( "Invalid View: " + "Subtitle" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_MarketingSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SPLD_MarketingSection" ).getStringFromAttribute( "Subtitle", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Subtitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl Subtitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SPLD_MarketingSection.Subtitle: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SPLD_MarketingSection" );
      }
   }
%>

<input class="text12" name="Subtitle" id="Subtitle" style="width:560px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* NoteToReviewer::Text */ %>

<span  id="NoteToReviewer:" name="NoteToReviewer:" style="width:130px;height:16px;">Note to Reviewer:</span>

<span style="height:24px;">&nbsp&nbsp</span>
<% /* NoteToReviewer:MLEdit */ %>
<%
   // MLEdit: NoteToReviewer
   strErrorMapValue = VmlOperation.CheckError( "NoteToReviewer", strError );
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
         task.log( ).info( "Invalid View: " + "NoteToReviewer" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_MarketingSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSPLDef.cursor( "SPLD_MarketingSection" ).getStringFromAttribute( "ReviewerNote", "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "SPLD_MarketingSection.ReviewerNote: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist: " + "mSPLDef.SPLD_MarketingSection" );
      }
   }
%>

<textarea name="NoteToReviewer" id="NoteToReviewer"style="width:562px;height:24px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingSection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingStatements:GroupBox */ %>

<div id="MarketingStatements" name="MarketingStatements" style="width:732px;height:256px;float:left;">  <!-- MarketingStatements --> 

<div  id="MarketingStatements" name="MarketingStatements" >Marketing Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:24px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridMarketing:Grid */ %>
<div class="tableScroll"  style="height:224px;">

<table name="GridMarketing" id="GridMarketing" cellspacing=0  cols=4  >

<thead><tr>

   <th>Select</th>
   <th>Statement Text</th>
   <th>Move Up</th>
   <th>Move Down</th>

</tr></thead>

<tbody height="174px;">

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
      String strSelect;
      String strSelectValue;
      String strGridEditMarketing;
      String strBMBMoveMarketingStatementUp;
      String strBMBMoveMarketingStatementDown;
      
      View vGridMarketing;
      vGridMarketing = mSPLDef.newView( );
      csrRC2 = vGridMarketing.cursor( "SPLD_MarketingStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridMarketing.cursor( "SPLD_MarketingStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strSelect = "";
         nRC = vGridMarketing.cursor( "SPLD_MarketingStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strSelect = vGridMarketing.cursor( "SPLD_MarketingStatement" ).getStringFromAttribute( "Selected", "" );

            if ( strSelect == null )
               strSelect = "";
         }

         if ( StringUtils.equals( strSelect, "Y" ) )
         {
            strSelectValue = "Select" + strEntityKey;
            strSelect = "<input name='" + strSelectValue + "' id='" + strSelectValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strSelectValue = "Select" + strEntityKey;
            strSelect = "<input name='" + strSelectValue + "' id='" + strSelectValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditMarketing = "";
         nRC = vGridMarketing.cursor( "SPLD_MarketingStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditMarketing = vGridMarketing.cursor( "SPLD_MarketingStatement" ).getStringFromAttribute( "Text", "" );

            if ( strGridEditMarketing == null )
               strGridEditMarketing = "";
         }

         if ( StringUtils.isBlank( strGridEditMarketing ) )
            strGridEditMarketing = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strSelect%></td>
   <td><%=strGridEditMarketing%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveMarketingStatementUp" onclick="MoveMarketingStmtUp( this.id )" id="BMBMoveMarketingStatementUp::<%=strEntityKey%>"><img src="./images/ePammsUp.jpg" alt="Move Up"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveMarketingStatementDown" onclick="MoveMarketingStmtDown( this.id )" id="BMBMoveMarketingStatementDown::<%=strEntityKey%>"><img src="./images/ePammsDown.jpg" alt="Move Down"></a></td>

</tr>

<%
         csrRC2 = vGridMarketing.cursor( "SPLD_MarketingStatement" ).setNextContinue( );
      }
      vGridMarketing.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingStatements --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:20px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* TabACS:Tab */ %>

<div id="TabACS" class="tab-pane" style="width:730px;"> <!-- Beginning of Tab Control TabACS -->
<script type="text/javascript">TabACS = new WebFXTabPane( document.getElementById( "TabACS" ) );</script>

<div id="TabAreasOfUse" class="tab-page " > <!-- Tab item TabAreasOfUse -->
<h2 class="tab"><span>Areas of Use</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabAreasOfUse" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingAreasOfUseStatements:GroupBox */ %>

<div id="MarketingAreasOfUseStatements" name="MarketingAreasOfUseStatements" style="width:710px;height:308px;float:left;">  <!-- MarketingAreasOfUseStatements --> 

<div  id="MarketingAreasOfUseStatements" name="MarketingAreasOfUseStatements" >Marketing:  Areas of Use Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllAreas:Text */ %>

<a href="#" id="HTSelectAllAreas" name="HTSelectAllAreas"  onclick="SelectAllAreasOfUse( );" style="width:108px;height:16px;">Select All</a>

<% /* HTClearSelectedAreas:Text */ %>

<a href="#" id="HTClearSelectedAreas" name="HTClearSelectedAreas"  onclick="ClearSelectedAreasOfUse( );" style="width:108px;height:16px;">Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* AreasOfUse:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="AreasOfUse" id="AreasOfUse" cellspacing=0  cols=2  >

<thead><tr>

   <th>Select</th>
   <th></th>

</tr></thead>

<tbody height="212px;">

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
      String strGS_AreasOfUse;
      String strGS_AreasOfUseValue;
      String strGridEditAreasOfUse;
      
      View vAreasOfUse;
      vAreasOfUse = mSPLDef.newView( );
      csrRC2 = vAreasOfUse.cursor( "MarketingAreasOfUse" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vAreasOfUse.cursor( "MarketingAreasOfUse" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_AreasOfUse = "";
         nRC = vAreasOfUse.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_AreasOfUse = vAreasOfUse.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "wkSelected", "" );

            if ( strGS_AreasOfUse == null )
               strGS_AreasOfUse = "";
         }

         if ( StringUtils.equals( strGS_AreasOfUse, "Y" ) )
         {
            strGS_AreasOfUseValue = "GS_AreasOfUse" + strEntityKey;
            strGS_AreasOfUse = "<input name='" + strGS_AreasOfUseValue + "' id='" + strGS_AreasOfUseValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_AreasOfUseValue = "GS_AreasOfUse" + strEntityKey;
            strGS_AreasOfUse = "<input name='" + strGS_AreasOfUseValue + "' id='" + strGS_AreasOfUseValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditAreasOfUse = "";
         nRC = vAreasOfUse.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditAreasOfUse = vAreasOfUse.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditAreasOfUse == null )
               strGridEditAreasOfUse = "";
         }

         if ( StringUtils.isBlank( strGridEditAreasOfUse ) )
            strGridEditAreasOfUse = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_AreasOfUse%></td>
   <td><%=strGridEditAreasOfUse%></td>

</tr>

<%
         csrRC2 = vAreasOfUse.cursor( "MarketingAreasOfUse" ).setNextContinue( );
      }
      vAreasOfUse.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingAreasOfUseStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabAreasOfUse -->

<div id="TabTypesSurfaces" class="tab-page " > <!-- Tab item TabTypesSurfaces -->
<h2 class="tab"><span>Types of Surfaces</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabTypesSurfaces" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingTypesSurfaces:GroupBox */ %>

<div id="MarketingTypesSurfaces" name="MarketingTypesSurfaces" style="width:710px;height:308px;float:left;">  <!-- MarketingTypesSurfaces --> 

<div  id="MarketingTypesSurfaces" name="MarketingTypesSurfaces" >Marketing:  Types of Surfaces Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllSurfaces:Text */ %>

<a href="#" id="HTSelectAllSurfaces" name="HTSelectAllSurfaces"  onclick="SelectAllSurfaces( );" style="width:108px;height:16px;">Select All</a>

<% /* HTClearSelectedSurfaces:Text */ %>

<a href="#" id="HTClearSelectedSurfaces" name="HTClearSelectedSurfaces"  onclick="ClearSelectedSurfaces( );" style="width:108px;height:16px;">Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Surfaces:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="Surfaces" id="Surfaces" cellspacing=0  cols=2  >

<thead><tr>

   <th>Select</th>
   <th></th>

</tr></thead>

<tbody height="212px;">

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
      String strGS_Surface;
      String strGS_SurfaceValue;
      String strGridEditSurface;
      
      View vSurfaces;
      vSurfaces = mSPLDef.newView( );
      csrRC2 = vSurfaces.cursor( "MarketingSurface" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vSurfaces.cursor( "MarketingSurface" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_Surface = "";
         nRC = vSurfaces.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_Surface = vSurfaces.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "wkSelected", "" );

            if ( strGS_Surface == null )
               strGS_Surface = "";
         }

         if ( StringUtils.equals( strGS_Surface, "Y" ) )
         {
            strGS_SurfaceValue = "GS_Surface" + strEntityKey;
            strGS_Surface = "<input name='" + strGS_SurfaceValue + "' id='" + strGS_SurfaceValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SurfaceValue = "GS_Surface" + strEntityKey;
            strGS_Surface = "<input name='" + strGS_SurfaceValue + "' id='" + strGS_SurfaceValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditSurface = "";
         nRC = vSurfaces.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditSurface = vSurfaces.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditSurface == null )
               strGridEditSurface = "";
         }

         if ( StringUtils.isBlank( strGridEditSurface ) )
            strGridEditSurface = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_Surface%></td>
   <td><%=strGridEditSurface%></td>

</tr>

<%
         csrRC2 = vSurfaces.cursor( "MarketingSurface" ).setNextContinue( );
      }
      vSurfaces.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingTypesSurfaces --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabTypesSurfaces -->

<div id="TabApplTypes" class="tab-page " > <!-- Tab item TabApplTypes -->
<h2 class="tab"><span>Application Types</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabApplTypes" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingApplTypesStatements:GroupBox */ %>

<div id="MarketingApplTypesStatements" name="MarketingApplTypesStatements" style="width:710px;height:308px;float:left;">  <!-- MarketingApplTypesStatements --> 

<div  id="MarketingApplTypesStatements" name="MarketingApplTypesStatements" >Marketing:  Application Types Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllApplTypes:Text */ %>

<a href="#" id="HTSelectAllApplTypes" name="HTSelectAllApplTypes"  onclick="SelectAllApplTypes( );" style="width:108px;height:16px;">Select All</a>

<% /* HTClearSelectedApplTypes:Text */ %>

<a href="#" id="HTClearSelectedApplTypes" name="HTClearSelectedApplTypes"  onclick="ClearSelectedApplTypes( );" style="width:108px;height:16px;">Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* ApplTypes:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="ApplTypes" id="ApplTypes" cellspacing=0  cols=2  >

<thead><tr>

   <th>Select</th>
   <th></th>

</tr></thead>

<tbody height="212px;">

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
      String strGS_ApplType;
      String strGS_ApplTypeValue;
      String strGridEditApplType;
      
      View vApplTypes;
      vApplTypes = mSPLDef.newView( );
      csrRC2 = vApplTypes.cursor( "MarketingAppType" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vApplTypes.cursor( "MarketingAppType" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_ApplType = "";
         nRC = vApplTypes.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_ApplType = vApplTypes.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "wkSelected", "" );

            if ( strGS_ApplType == null )
               strGS_ApplType = "";
         }

         if ( StringUtils.equals( strGS_ApplType, "Y" ) )
         {
            strGS_ApplTypeValue = "GS_ApplType" + strEntityKey;
            strGS_ApplType = "<input name='" + strGS_ApplTypeValue + "' id='" + strGS_ApplTypeValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_ApplTypeValue = "GS_ApplType" + strEntityKey;
            strGS_ApplType = "<input name='" + strGS_ApplTypeValue + "' id='" + strGS_ApplTypeValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditApplType = "";
         nRC = vApplTypes.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditApplType = vApplTypes.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditApplType == null )
               strGridEditApplType = "";
         }

         if ( StringUtils.isBlank( strGridEditApplType ) )
            strGridEditApplType = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_ApplType%></td>
   <td><%=strGridEditApplType%></td>

</tr>

<%
         csrRC2 = vApplTypes.cursor( "MarketingAppType" ).setNextContinue( );
      }
      vApplTypes.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingApplTypesStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabApplTypes -->

<div id="TabBacteria" class="tab-page " > <!-- Tab item TabBacteria -->
<h2 class="tab"><span>Bacteria</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabBacteria" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingBacteriaStatements:GroupBox */ %>

<div id="MarketingBacteriaStatements" name="MarketingBacteriaStatements" style="width:710px;height:308px;float:left;">  <!-- MarketingBacteriaStatements --> 

<div  id="MarketingBacteriaStatements" name="MarketingBacteriaStatements" >Marketing:  Bacteria Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllBacteria:Text */ %>

<a href="#" id="HTSelectAllBacteria" name="HTSelectAllBacteria"  onclick="SelectAllBacteria( );" style="width:108px;height:16px;">Select All</a>

<% /* HTClearSelectedBacteria:Text */ %>

<a href="#" id="HTClearSelectedBacteria" name="HTClearSelectedBacteria"  onclick="ClearSelectedBacteria( );" style="width:108px;height:16px;">Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Bacteria:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="Bacteria" id="Bacteria" cellspacing=0  cols=2  >

<thead><tr>

   <th>Select</th>
   <th></th>

</tr></thead>

<tbody height="212px;">

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
      String strGS_Bacteria;
      String strGS_BacteriaValue;
      String strGridEditBacteria;
      
      View vBacteria;
      vBacteria = mSPLDef.newView( );
      csrRC2 = vBacteria.cursor( "MarketingBacteria" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vBacteria.cursor( "MarketingBacteria" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_Bacteria = "";
         nRC = vBacteria.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_Bacteria = vBacteria.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "wkSelected", "" );

            if ( strGS_Bacteria == null )
               strGS_Bacteria = "";
         }

         if ( StringUtils.equals( strGS_Bacteria, "Y" ) )
         {
            strGS_BacteriaValue = "GS_Bacteria" + strEntityKey;
            strGS_Bacteria = "<input name='" + strGS_BacteriaValue + "' id='" + strGS_BacteriaValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_BacteriaValue = "GS_Bacteria" + strEntityKey;
            strGS_Bacteria = "<input name='" + strGS_BacteriaValue + "' id='" + strGS_BacteriaValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditBacteria = "";
         nRC = vBacteria.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditBacteria = vBacteria.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditBacteria == null )
               strGridEditBacteria = "";
         }

         if ( StringUtils.isBlank( strGridEditBacteria ) )
            strGridEditBacteria = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_Bacteria%></td>
   <td><%=strGridEditBacteria%></td>

</tr>

<%
         csrRC2 = vBacteria.cursor( "MarketingBacteria" ).setNextContinue( );
      }
      vBacteria.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingBacteriaStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabBacteria -->

<div id="TabFungi" class="tab-page " > <!-- Tab item TabFungi -->
<h2 class="tab"><span>Fungi</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabFungi" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingFungiStatements:GroupBox */ %>

<div id="MarketingFungiStatements" name="MarketingFungiStatements" style="width:710px;height:308px;float:left;">  <!-- MarketingFungiStatements --> 

<div  id="MarketingFungiStatements" name="MarketingFungiStatements" >Marketing:  Fungi Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllFungi:Text */ %>

<a href="#" id="HTSelectAllFungi" name="HTSelectAllFungi"  onclick="SelectAllFungi( );" style="width:108px;height:16px;">Select All</a>

<% /* HTClearSelectedFungi:Text */ %>

<a href="#" id="HTClearSelectedFungi" name="HTClearSelectedFungi"  onclick="ClearSelectedFungi( );" style="width:108px;height:16px;">Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Fungi:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="Fungi" id="Fungi" cellspacing=0  cols=2  >

<thead><tr>

   <th>Select</th>
   <th></th>

</tr></thead>

<tbody height="212px;">

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
      String strGS_Fungi;
      String strGS_FungiValue;
      String strGridEditFungi;
      
      View vFungi;
      vFungi = mSPLDef.newView( );
      csrRC2 = vFungi.cursor( "MarketingFungi" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vFungi.cursor( "MarketingFungi" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_Fungi = "";
         nRC = vFungi.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_Fungi = vFungi.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "wkSelected", "" );

            if ( strGS_Fungi == null )
               strGS_Fungi = "";
         }

         if ( StringUtils.equals( strGS_Fungi, "Y" ) )
         {
            strGS_FungiValue = "GS_Fungi" + strEntityKey;
            strGS_Fungi = "<input name='" + strGS_FungiValue + "' id='" + strGS_FungiValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_FungiValue = "GS_Fungi" + strEntityKey;
            strGS_Fungi = "<input name='" + strGS_FungiValue + "' id='" + strGS_FungiValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditFungi = "";
         nRC = vFungi.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditFungi = vFungi.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditFungi == null )
               strGridEditFungi = "";
         }

         if ( StringUtils.isBlank( strGridEditFungi ) )
            strGridEditFungi = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_Fungi%></td>
   <td><%=strGridEditFungi%></td>

</tr>

<%
         csrRC2 = vFungi.cursor( "MarketingFungi" ).setNextContinue( );
      }
      vFungi.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingFungiStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabFungi -->

<div id="TabViruses" class="tab-page " > <!-- Tab item TabViruses -->
<h2 class="tab"><span>Viruses</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabViruses" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* MarketingVirusesStatements:GroupBox */ %>

<div id="MarketingVirusesStatements" name="MarketingVirusesStatements" style="width:710px;height:308px;float:left;">  <!-- MarketingVirusesStatements --> 

<div  id="MarketingVirusesStatements" name="MarketingVirusesStatements" >Marketing:  Viruses Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllViruses:Text */ %>

<a href="#" id="HTSelectAllViruses" name="HTSelectAllViruses"  onclick="SelectAllViruses( );" style="width:108px;height:16px;">Select All</a>

<% /* HTClearSelectedViruses:Text */ %>

<a href="#" id="HTClearSelectedViruses" name="HTClearSelectedViruses"  onclick="ClearSelectedViruses( );" style="width:108px;height:16px;">Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Viruses:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="Viruses" id="Viruses" cellspacing=0  cols=2  >

<thead><tr>

   <th>Select</th>
   <th></th>

</tr></thead>

<tbody height="212px;">

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
      String strGS_Viruses;
      String strGS_VirusesValue;
      String strGridEditViruses;
      
      View vViruses;
      vViruses = mSPLDef.newView( );
      csrRC2 = vViruses.cursor( "MarketingViruses" ).setFirst( "SPLD_MarketingSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vViruses.cursor( "MarketingViruses" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_Viruses = "";
         nRC = vViruses.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_Viruses = vViruses.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "wkSelected", "" );

            if ( strGS_Viruses == null )
               strGS_Viruses = "";
         }

         if ( StringUtils.equals( strGS_Viruses, "Y" ) )
         {
            strGS_VirusesValue = "GS_Viruses" + strEntityKey;
            strGS_Viruses = "<input name='" + strGS_VirusesValue + "' id='" + strGS_VirusesValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_VirusesValue = "GS_Viruses" + strEntityKey;
            strGS_Viruses = "<input name='" + strGS_VirusesValue + "' id='" + strGS_VirusesValue + "' value='Y' type='checkbox' > ";
         }

         strGridEditViruses = "";
         nRC = vViruses.cursor( "SPLD_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditViruses = vViruses.cursor( "SPLD_MarketingUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditViruses == null )
               strGridEditViruses = "";
         }

         if ( StringUtils.isBlank( strGridEditViruses ) )
            strGridEditViruses = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_Viruses%></td>
   <td><%=strGridEditViruses%></td>

</tr>

<%
         csrRC2 = vViruses.cursor( "MarketingViruses" ).setNextContinue( );
      }
      vViruses.drop( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  MarketingVirusesStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabViruses -->

</div> <!-- End of Tab Control TabACS -->

<script type="text/javascript">setupAllTabs( );</script>

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
   session.setAttribute( "ZeidonWindow", "wSPLDMarketingSection" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
