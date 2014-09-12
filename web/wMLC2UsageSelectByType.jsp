<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wMLC2UsageSelectByType --%>

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
      // Grid: Grid1
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_UsageSelectTarget" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_UsageSelectTarget" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GridCheckCtl2" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GridCheckCtl2", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "M_UsageSelectTarget" ).setAttribute( "wSelected", strMapValue );
               else
                  vGridTmp.cursor( "M_UsageSelectTarget" ).setAttribute( "wSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "M_UsageSelectTarget" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // ComboBox: ComboBox1
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "M_UsageType" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hComboBox1" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               mMasLC.cursor( "M_UsageType" ).setPosition( nRelPos, "" );
            }
         }  // checkExistenceofEntity
      }

      // Grid: Grid2
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_Usage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_Usage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GridCheckCtl1" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GridCheckCtl1", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "M_Usage" ).setAttribute( "wSelected", strMapValue );
               else
                  vGridTmp.cursor( "M_Usage" ).setAttribute( "wSelected", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "M_Usage" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLC2UsageSelectByType") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLC2UsageSelectByType strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLC2UsageSelectByType LastWindow *** " + strLastWindow );
task.log().info("*** wMLC2UsageSelectByType LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptMLC_UsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.AcceptMLC_UsageEntries" );
      try
      {
         nOptRC = wMLC2.AcceptMLC_UsageEntries( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptMLC_UsageEntries: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SELECT_MLC_UsageTypeForSource" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.SELECT_MLC_UsageTypeForSource" );
      try
      {
         nOptRC = wMLC2.SELECT_MLC_UsageTypeForSource( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SELECT_MLC_UsageTypeForSource: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelMLC_UsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CLEAR_MLC_UsageSource" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.CLEAR_MLC_UsageSource" );
      try
      {
         nOptRC = wMLC2.CLEAR_MLC_UsageSource( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CLEAR_MLC_UsageSource: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SETALL_MLC_UsageTarget" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.SETALL_MLC_UsageTarget" );
      try
      {
         nOptRC = wMLC2.SETALL_MLC_UsageTarget( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SETALL_MLC_UsageTarget: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CLEAR_MLC_UsageTarget" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.CLEAR_MLC_UsageTarget" );
      try
      {
         nOptRC = wMLC2.CLEAR_MLC_UsageTarget( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CLEAR_MLC_UsageTarget: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "RemoveMLC_UsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.RemoveMLC_UsageEntries" );
      try
      {
         nOptRC = wMLC2.RemoveMLC_UsageEntries( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation RemoveMLC_UsageEntries: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectMLC_UsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.SelectMLC_UsageEntries" );
      try
      {
         nOptRC = wMLC2.SelectMLC_UsageEntries( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SelectMLC_UsageEntries: " + e.getMessage();
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SETALL_MLC_UsageSource" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2UsageSelectByType.jsp", "wMLC2.SETALL_MLC_UsageSource" );
      try
      {
         nOptRC = wMLC2.SETALL_MLC_UsageSource( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SETALL_MLC_UsageSource: " + e.getMessage();
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

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLC2UsageSelectByType" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLC2UsageSelectByType" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2UsageSelectByType", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLC2UsageSelectByType.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLC2UsageSelectByType.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLC2UsageSelectByType.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLC2UsageSelectByType.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC2", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wMLC2" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "UsageSelectByType" );
   }

%>

<html>
<head>

<title>MLC Usage Select</title>

<%@ include file="./include/myheader.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/validations.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLC2UsageSelectByType.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="AcceptMLC_UsageEntries( )">Accept and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="CancelMLC_UsageEntries( )">Cancel and Return</a></li>
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


<form name="wMLC2UsageSelectByType" id="wMLC2UsageSelectByType" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC2", "UsageSelectByType" );
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

<% /* GBAddAppTypesList1:GroupBox */ %>

<div id="GBAddAppTypesList1" name="GBAddAppTypesList1" style="width:504px;height:32px;position:absolute;left:8px;top:2px;">  <!-- GBAddAppTypesList1 --> 

<% /* AddAppTypesList1:Text */ %>

<label class="groupbox"  id="AddAppTypesList1" name="AddAppTypesList1" style="width:350px;height:16px;position:absolute;left:6px;top:12px;">Selection of MLC Usage Entries</label>


</div>  <!--  GBAddAppTypesList1 --> 
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:866px;height:262px;position:absolute;left:6px;top:32px;">  <!-- GroupBox4 --> 

<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:360px;height:224px;position:absolute;left:0px;top:2px;">  <!-- GroupBox1 --> 

<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" style="width:342px;height:42px;position:absolute;left:14px;top:0px;">  <!-- GroupBox6 --> 

<% /* Text1:Text */ %>

<label  id="Text1" name="Text1" style="width:254px;height:22px;position:absolute;left:0px;top:0px;">Currently Selected MLC Usage Entries</label>

<% /* HTSelectAllAreasOfUse2:Text */ %>

<a href="#" id="HTSelectAllAreasOfUse2" name="HTSelectAllAreasOfUse2"  onclick="CLEAR_MLC_UsageTarget( );" style="width:134px;height:16px;position:absolute;left:22px;top:24px;">Clear Target Entries</a>

<% /* Text4:Text */ %>

<a href="#" id="Text4" name="Text4"  onclick="SETALL_MLC_UsageTarget( );" style="width:178px;height:16px;position:absolute;left:154px;top:24px;">         Set All Target Entries</a>


</div>  <!--  GroupBox6 --> 
<% /* Grid1:Grid */ %>
<table  cols=3 style="position:absolute;top:34px;left:0px;width:354px;"  name="Grid1" id="Grid1">

<thead><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GridCheckCtl2')"></th>
   <th style="width:98px;">Type</th>
   <th style="width:214px;">Name</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridCheckCtl2;
      String strGridCheckCtl2Value;
      String strGridEditCtl2;
      String strGridEditCtl3;
      
      View vGrid1;
      vGrid1 = mMasLC.newView( );
      csrRC2 = vGrid1.cursor( "M_UsageSelectTarget" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid1.cursor( "M_UsageSelectTarget" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridCheckCtl2 = "";
         nRC = vGrid1.cursor( "M_UsageSelectTarget" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridCheckCtl2 = vGrid1.cursor( "M_UsageSelectTarget" ).getStringFromAttribute( "wSelected", "" );

            if ( strGridCheckCtl2 == null )
               strGridCheckCtl2 = "";
         }

         if ( StringUtils.equals( strGridCheckCtl2, "Y" ) )
         {
            strGridCheckCtl2Value = "GridCheckCtl2" + strEntityKey;
            strGridCheckCtl2 = "<input name='" + strGridCheckCtl2Value + "' id='" + strGridCheckCtl2Value + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGridCheckCtl2Value = "GridCheckCtl2" + strEntityKey;
            strGridCheckCtl2 = "<input name='" + strGridCheckCtl2Value + "' id='" + strGridCheckCtl2Value + "' value='Y' type='checkbox' > ";
         }

         strGridEditCtl2 = "";
         nRC = vGrid1.cursor( "M_UsageSelectTarget" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl2 = vGrid1.cursor( "M_UsageSelectTarget" ).getStringFromAttribute( "UsageType", "FullUsageType" );

            if ( strGridEditCtl2 == null )
               strGridEditCtl2 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl2 ) )
            strGridEditCtl2 = "&nbsp";

         strGridEditCtl3 = "";
         nRC = vGrid1.cursor( "M_UsageSelectTarget" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl3 = vGrid1.cursor( "M_UsageSelectTarget" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditCtl3 == null )
               strGridEditCtl3 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl3 ) )
            strGridEditCtl3 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGridCheckCtl2%></td>
   <td nowrap style="width:98px;"><%=strGridEditCtl2%></td>
   <td nowrap style="width:214px;"><%=strGridEditCtl3%></td>

</tr>

<%
         csrRC2 = vGrid1.cursor( "M_UsageSelectTarget" ).setNextContinue( );
      }
      vGrid1.drop( );
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


</div>  <!--  GroupBox1 --> 
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:28px;height:224px;position:absolute;left:358px;top:2px;">  <!-- GroupBox3 --> 

<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:22px;height:76px;position:absolute;left:0px;top:0px;">  <!-- GroupBox5 --> 


</div>  <!--  GroupBox5 --> 
<% /* PushBtn1:PushBtn */ %>
<button type="button" name="PushBtn1" id="PushBtn1" value="" onclick="SelectMLC_UsageEntries( )" style="width:26px;height:32px;position:absolute;left:0px;top:60px;"><-</button>

<% /* PushBtn2:PushBtn */ %>
<button type="button" name="PushBtn2" id="PushBtn2" value="" onclick="RemoveMLC_UsageEntries( )" style="width:26px;height:32px;position:absolute;left:0px;top:98px;">-></button>


</div>  <!--  GroupBox3 --> 
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:468px;height:224px;position:absolute;left:386px;top:2px;">  <!-- GroupBox2 --> 

<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7" style="width:452px;height:42px;position:absolute;left:2px;top:0px;">  <!-- GroupBox7 --> 

<% /* Text3:Text */ %>

<label  id="Text3" name="Text3" style="width:244px;height:24px;position:absolute;left:0px;top:0px;">Potential MLC Usage Entries for Type</label>

<% /* ComboBox1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox1" id="ComboBox1" size="1"style="width:166px;position:absolute;left:266px;top:0px;" onchange="ComboBox1OnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
         strComboCurrentValue = "";
      View vComboBox1;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "M_UsageType" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mMasLC.cursor( "M_UsageType" ).getStringFromAttribute( "UsageType", "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vComboBox1 = mMasLC.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";
      csrRC = vComboBox1.cursor( "M_UsageType" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vComboBox1.cursor( "M_UsageType" ).getStringFromAttribute( "UsageType", "" );
         if ( strErrorMapValue == null )
            strErrorMapValue = "";

         if ( StringUtils.equals( strComboCurrentValue, strErrorMapValue ) )
         {
%>
            <option selected="selected"><%=strErrorMapValue%></option>
<%
            strComboSelectedValue = Integer.toString( ComboCount );
         }
         else
         {
%>
            <option><%=strErrorMapValue%></option>
<%
         }

         ComboCount++;
         csrRC =  vComboBox1.cursor( "M_UsageType" ).setNextContinue( );
      }

      vComboBox1.drop( );

   }
%>
</select>
<input name="hComboBox1" id="hComboBox1" type="hidden" value="<%=strComboSelectedValue%>" >

<% /* HTSelectAllAreasOfUse1:Text */ %>

<a href="#" id="HTSelectAllAreasOfUse1" name="HTSelectAllAreasOfUse1"  onclick="CLEAR_MLC_UsageSource( );" style="width:152px;height:16px;position:absolute;left:106px;top:24px;">Clear Source Entries</a>

<% /* Text2:Text */ %>

<a href="#" id="Text2" name="Text2"  onclick="SETALL_MLC_UsageSource( );" style="width:184px;height:16px;position:absolute;left:258px;top:24px;">         Set All Source Entries</a>


</div>  <!--  GroupBox7 --> 
<% /* Grid2:Grid */ %>
<table  cols=2 style="position:absolute;top:34px;left:0px;width:410px;"  name="Grid2" id="Grid2">

<thead><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GridCheckCtl1')"></th>
   <th style="width:288px;">Name</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridCheckCtl1;
      String strGridCheckCtl1Value;
      String strGridEditCtl1;
      
      View vGrid2;
      vGrid2 = mMasLC.newView( );
      csrRC2 = vGrid2.cursor( "M_Usage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid2.cursor( "M_Usage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridCheckCtl1 = "";
         nRC = vGrid2.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridCheckCtl1 = vGrid2.cursor( "M_Usage" ).getStringFromAttribute( "wSelected", "" );

            if ( strGridCheckCtl1 == null )
               strGridCheckCtl1 = "";
         }

         if ( StringUtils.equals( strGridCheckCtl1, "Y" ) )
         {
            strGridCheckCtl1Value = "GridCheckCtl1" + strEntityKey;
            strGridCheckCtl1 = "<input name='" + strGridCheckCtl1Value + "' id='" + strGridCheckCtl1Value + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGridCheckCtl1Value = "GridCheckCtl1" + strEntityKey;
            strGridCheckCtl1 = "<input name='" + strGridCheckCtl1Value + "' id='" + strGridCheckCtl1Value + "' value='Y' type='checkbox' > ";
         }

         strGridEditCtl1 = "";
         nRC = vGrid2.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl1 = vGrid2.cursor( "M_Usage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditCtl1 == null )
               strGridEditCtl1 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl1 ) )
            strGridEditCtl1 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGridCheckCtl1%></td>
   <td nowrap style="width:288px;"><%=strGridEditCtl1%></td>

</tr>

<%
         csrRC2 = vGrid2.cursor( "M_Usage" ).setNextContinue( );
      }
      vGrid2.drop( );
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


</div>  <!--  GroupBox2 --> 

</div>  <!--  GroupBox4 --> 

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

</div>  <!-- This is the end tag for wrapper -->

</body>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wMLC2UsageSelectByType" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
