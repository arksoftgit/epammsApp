<!DOCTYPE HTML>

<%-- wSLCUpdateSubregProduct --%>

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

   View mSubProd = null;
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

   mSubProd = task.getViewByName( "mSubProd" );
   if ( VmlOperation.isValid( mSubProd ) )
   {
      // EditBox: Description
      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Description" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Description", "", strMapValue );
            else
               mSubProd.cursor( "SubregProduct" ).setAttribute( "Description", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Description", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EPA_RegistrationNumber
      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EPA_RegistrationNumber" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EPA_RegistrationNumber", "", strMapValue );
            else
               mSubProd.cursor( "SubregProduct" ).setAttribute( "EPA_RegistrationNumber", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EPA_RegistrationNumber", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EPA_EstablishmentNumber
      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EPA_EstablishmentNumber" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EPA_EstablishmentNumber", "", strMapValue );
            else
               mSubProd.cursor( "SubregProduct" ).setAttribute( "EPA_EstablishmentNumber", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EPA_EstablishmentNumber", e.getReason( ), strMapValue );
         }
      }

      // Calendar: ESL_Date
      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "ESL_Date" );
         strDateFormat = request.getParameter( "zDateFormat" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ESL_Date", "", strMapValue );
            else
               mSubProd.cursor( "SubregProduct" ).setAttribute( "ESL_Date", strMapValue, strDateFormat );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ESL_Date", e.getReason( ), strMapValue );
         }
      }


      // Calendar: DraftLabel
      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "DraftLabel" );
         strDateFormat = request.getParameter( "zDateFormat" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DraftLabel", "", strMapValue );
            else
               mSubProd.cursor( "SubregProduct" ).setAttribute( "EPA_DraftLabel", strMapValue, strDateFormat );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DraftLabel", e.getReason( ), strMapValue );
         }
      }


      // Grid: SLC_List
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubProd.newView( );
      csrRC = vGridTmp.cursor( "SubregLabelContent" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "SubregLabelContent" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "SubregLabelContent" ).setNextContinue( );
      }

      vGridTmp.drop( );
   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      // EditBox: Name
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Name" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Name", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).setAttribute( "AttemptProductName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Name", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Number
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Number" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Number", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).setAttribute( "AttemptProductNumber", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Number", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wSLCUpdateSubregProduct") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSLC_Dialog wSLC = new wSLC_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSLCUpdateSubregProduct strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSLCUpdateSubregProduct LastWindow *** " + strLastWindow );
task.log().info("*** wSLCUpdateSubregProduct LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptUpdateSubregProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.AcceptUpdateSubregProduct" );
      try
      {
         nOptRC = wSLC.AcceptUpdateSubregProduct( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptUpdateSubregProduct: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelUpdateSubregProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.CancelUpdateSubregProduct" );
      try
      {
         nOptRC = wSLC.CancelUpdateSubregProduct( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelUpdateSubregProduct: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CompareSLC_ToNextMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.CompareSLC_ToNextMLC" );
      try
      {
         nOptRC = wSLC.CompareSLC_ToNextMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CompareSLC_ToNextMLC: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSystem", "AnalysisDifferences" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CompareSLC_ToNextMLC_Net" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.CompareSLC_ToNextMLC_Net" );
      try
      {
         nOptRC = wSLC.CompareSLC_ToNextMLC_Net( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CompareSLC_ToNextMLC_Net: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSystem", "AnalysisDifferences" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeleteSLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.DeleteSLC" );
      try
      {
         nOptRC = wSLC.DeleteSLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation DeleteSLC: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeleteSubregLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.DeleteSubregLabelContent" );
      try
      {
         nOptRC = wSLC.DeleteSubregLabelContent( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation DeleteSubregLabelContent: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "DeleteSubregLabelContent" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeleteSubregProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.DeleteSubregProduct" );
      try
      {
         nOptRC = wSLC.DeleteSubregProduct( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation DeleteSubregProduct: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "DeleteSubregProduct" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GenerateNewSLC_Version" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.GenerateNewSLC_Version" );
      try
      {
         nOptRC = wSLC.GenerateNewSLC_Version( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation GenerateNewSLC_Version: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveSLC_Down" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.MoveSLC_Down" );
      try
      {
         nOptRC = wSLC.MoveSLC_Down( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveSLC_Down: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveSLC_Up" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.MoveSLC_Up" );
      try
      {
         nOptRC = wSLC.MoveSLC_Up( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveSLC_Up: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveSubregProductDown" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.MoveSubregProductDown" );
      try
      {
         nOptRC = wSLC.MoveSubregProductDown( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveSubregProductDown: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveSubregProductUp" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.MoveSubregProductUp" );
      try
      {
         nOptRC = wSLC.MoveSubregProductUp( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveSubregProductUp: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "NewSubregLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.NewSubregLabelContent" );
      try
      {
         nOptRC = wSLC.NewSubregLabelContent( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation NewSubregLabelContent: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "NewSubregLabelContent" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ReloadSLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.ReloadSLC" );
      try
      {
         nOptRC = wSLC.ReloadSLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation ReloadSLC: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectMarketingStmtForUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.SelectMarketingStmtForUpdate" );
      try
      {
         nOptRC = wSLC.SelectMarketingStmtForUpdate( new zVIEW( vKZXMLPGO ) );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "MarketingStatement" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UpdatePhysicalLabel" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.UpdatePhysicalLabel" );
      try
      {
         nOptRC = wSLC.UpdatePhysicalLabel( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation UpdatePhysicalLabel: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSPLD", "SPLDList" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UpdateSubregLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.UpdateSubregLabelContent" );
      try
      {
         nOptRC = wSLC.UpdateSubregLabelContent( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation UpdateSubregLabelContent: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "UpdateProductLabelContent" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "EditSubregLabelVersionData" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubProd;
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubProd.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubProd.cursor( "SubregLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubProd.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubProd.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.EditSubregLabelVersionData" );
      try
      {
         nOptRC = wSLC.EditSubregLabelVersionData( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditSubregLabelVersionData: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "VersionData" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UpdateSubregProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.UpdateSubregProduct" );
      try
      {
         nOptRC = wSLC.UpdateSubregProduct( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation UpdateSubregProduct: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "UpdateSubregProduct" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptUpdateSubregProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.AcceptUpdateSubregProduct" );
      try
      {
         nOptRC = wSLC.AcceptUpdateSubregProduct( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptUpdateSubregProduct: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelUpdateSubregProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.CancelUpdateSubregProduct" );
      try
      {
         nOptRC = wSLC.CancelUpdateSubregProduct( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelUpdateSubregProduct: " + e.getMessage();
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.ProductManagement" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "wStartUp", "AdminListPrimaryRegistrants" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.SubregistrantManagement" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "wStartUp", "AdminListSubregistrants" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTrackingNotificationCompliance" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.TrackingNotificationCompliance" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mStateRegistrations" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.StateRegistrations" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mMarketingFulfillment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.MarketingFulfillment" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mWebDevelopment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.WebDevelopment" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mAdministration" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartTopWindow, "wStartUp", "AdminUpdatePrimaryRegistrant" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wStartUp.ProcessLogin" );
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
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ResetTopWindow, "wStartUp", "UserLogin" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSLCUpdateSubregProduct" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSLCUpdateSubregProduct" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCUpdateSubregProduct.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCUpdateSubregProduct.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSLCUpdateSubregProduct.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSLCUpdateSubregProduct.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProduct.jsp", "wSLC.InitSubregProductForUpdate" );
   nOptRC = wSLC.InitSubregProductForUpdate( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wSLCUpdateSubregProduct.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSLC" +
                         "&OperationName=" + "InitSubregProductForUpdate";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wSLC" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "UpdateSubregProduct" );
   }

%>

<html>
<head>

<title>Update Subregistrant Product</title>

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
<script language="JavaScript" type="text/javascript" src="./genjs/wSLCUpdateSubregProduct.js"></script>

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
       <li><a href="#"  onclick="smAcceptUpdateSubregProduct( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelUpdateSubregProduct( )">Cancel and Return</a></li>
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


<form name="wSLCUpdateSubregProduct" id="wSLCUpdateSubregProduct" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lPrimReg = null;
   View lSPLDLST = null;
   View mMasLC = null;
   View mMasProd = null;
   View mPrimReg = null;
   View mSPLDef = null;
   View mSubLC = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSLC", "UpdateSubregProduct" );
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
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBSubregistrantProduct:GroupBox */ %>
<div id="GBSubregistrantProduct" name="GBSubregistrantProduct" style="float:left;width:824px;" >

<table cols=2 style="width:824px;"  class="grouptable">

<tr>
<td valign="top" style="width:184px;">
<% /* SubregistrantProduct:Text */ %>

<span  id="SubregistrantProduct" name="SubregistrantProduct" style="width:174px;height:16px;">Subregistrant Product</span>

</td>
<td valign="top" style="width:620px;">
<% /* Name:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Name", strError );
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
         task.log( ).debug( "Invalid View: " + "Name" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "AttemptProductName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Name: " + e.getMessage());
               task.log().error( "*** Error on ctrl Name", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptProductName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "wWebXfer.Root" );
      }
   }
%>

<input name="Name" id="Name" style="width:620px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* Number::Text */ %>

<span  id="Number:" name="Number:" style="width:174px;height:16px;">Number:</span>

</td>
<td valign="top" style="width:620px;">
<% /* Number:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Number", strError );
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
         task.log( ).debug( "Invalid View: " + "Number" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "AttemptProductNumber", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Number: " + e.getMessage());
               task.log().error( "*** Error on ctrl Number", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptProductNumber: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "wWebXfer.Root" );
      }
   }
%>

<input name="Number" id="Number" style="width:620px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* Description::Text */ %>

<span  id="Description:" name="Description:" style="width:174px;height:16px;">Description:</span>

</td>
<td valign="top" style="width:620px;">
<% /* Description:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Description", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) == false )
         task.log( ).debug( "Invalid View: " + "Description" );
      else
      {
         nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "Description", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Description: " + e.getMessage());
               task.log().error( "*** Error on ctrl Description", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregProduct.Description: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubProd.SubregProduct" );
      }
   }
%>

<input name="Description" id="Description" style="width:620px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* EPA_RegistrationNumber::Text */ %>

<span  id="EPA_RegistrationNumber:" name="EPA_RegistrationNumber:" style="width:174px;height:16px;">EPA Registration Number:</span>

</td>
<td valign="top" style="width:620px;">
<% /* EPA_RegistrationNumber:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EPA_RegistrationNumber", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) == false )
         task.log( ).debug( "Invalid View: " + "EPA_RegistrationNumber" );
      else
      {
         nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "EPA_RegistrationNumber", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EPA_RegistrationNumber: " + e.getMessage());
               task.log().error( "*** Error on ctrl EPA_RegistrationNumber", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregProduct.EPA_RegistrationNumber: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubProd.SubregProduct" );
      }
   }
%>

<input name="EPA_RegistrationNumber" id="EPA_RegistrationNumber" style="width:620px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* Est. No.::Text */ %>

<span  id="Est. No.:" name="Est. No.:" style="width:174px;height:16px;">Est. No.:</span>

</td>
<td valign="top" style="width:218px;">
<% /* EPA_EstablishmentNumber:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EPA_EstablishmentNumber", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) == false )
         task.log( ).debug( "Invalid View: " + "EPA_EstablishmentNumber" );
      else
      {
         nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "EPA_EstablishmentNumber", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EPA_EstablishmentNumber: " + e.getMessage());
               task.log().error( "*** Error on ctrl EPA_EstablishmentNumber", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregProduct.EPA_EstablishmentNumber: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubProd.SubregProduct" );
      }
   }
%>

<input name="EPA_EstablishmentNumber" id="EPA_EstablishmentNumber" style="width:218px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* ESL_Date::Text */ %>

<span  id="ESL_Date:" name="ESL_Date:" style="width:174px;height:16px;">ESL Date:</span>

</td>
<td valign="top" style="width:422px;">
<% /* ESL_Date:Calendar */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "ESL_Date", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) == false )
         task.log( ).debug( "Invalid View: " + "ESL_Date" );
      else
      {
         nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "ESL_Date", strDateFormat );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregProduct.ESL_Date: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubProd.SubregProduct" );
      }
   }
%>

<span style="width:422px;height:32px;" >
   <input name="ESL_Date" id="ESL_Date"  style="width:80px" type="text" value="<%=strErrorMapValue%>"  />
   <img src="images/scw.gif" title="Select Date" alt="Select Date"
        onclick="scwShow( document.getElementById( 'ESL_Date' ), this );"  />
</span>

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* DraftLabel::Text */ %>

<span  id="DraftLabel:" name="DraftLabel:" style="width:174px;height:16px;">Draft Label:</span>

</td>
<td valign="top" style="width:422px;">
<% /* DraftLabel:Calendar */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "DraftLabel", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubProd = task.getViewByName( "mSubProd" );
      if ( VmlOperation.isValid( mSubProd ) == false )
         task.log( ).debug( "Invalid View: " + "DraftLabel" );
      else
      {
         nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "EPA_DraftLabel", strDateFormat );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregProduct.EPA_DraftLabel: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubProd.SubregProduct" );
      }
   }
%>

<span style="width:422px;height:32px;" >
   <input name="DraftLabel" id="DraftLabel"  style="width:80px" type="text" value="<%=strErrorMapValue%>"  />
   <img src="images/scw.gif" title="Select Date" alt="Select Date"
        onclick="scwShow( document.getElementById( 'DraftLabel' ), this );"  />
</span>

</td>
</tr>
<tr>
<td valign="top" style="width:184px;">
<% /* ToxicityCategory::Text */ %>

<span  id="ToxicityCategory:" name="ToxicityCategory:" style="width:174px;height:16px;">Toxicity Category:</span>

</td>
<td valign="top" style="width:124px;">
<% /* ToxicityCategory:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ToxicityCategory" id="ToxicityCategory" size="1" style="width:124px;"  disabled onchange="ToxicityCategoryOnChange( )">

<%
   mSubProd = task.getViewByName( "mSubProd" );
   if ( VmlOperation.isValid( mSubProd ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubProd , "SubregProduct", "EPA_ToxicityCategory", "" );

      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "EPA_ToxicityCategory", "" );
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

<input name="hToxicityCategory" id="hToxicityCategory" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
</tr>
</table>

</div>  <!-- GBSubregistrantProduct --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBSubregLabelContent:GroupBox */ %>

<div id="GBSubregLabelContent" name="GBSubregLabelContent" class="listgroup" style="width:486px;height:40px;float:left;">  <!-- GBSubregLabelContent --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* SubregLabelContent:Text */ %>

<span class="listheader"  id="SubregLabelContent" name="SubregLabelContent" style="width:154px;height:16px;">Subregistrant Label Content</span>

<span style="height:26px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* New:PushBtn */ %>
<button type="button" class="newbutton" name="New" id="New" value="" onclick="NewSubregLabelContent( )" style="width:78px;height:26px;">New</button>

</div>  <!-- End of a new line -->


</div>  <!--  GBSubregLabelContent --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* SLC_List:Grid */ %>
<table  cols=10 style=""  name="SLC_List" id="SLC_List">

<thead><tr>

   <th>SLC Name</th>
   <th>SLC Version</th>
   <th>Update</th>
   <th>Delete</th>
   <th>Compare SLC to Next MLC</th>
   <th>Compare SLC to Next MLC (Net)</th>
   <th>New SLC Version</th>
   <th>Move Up</th>
   <th>Move Down</th>
   <th>Maintain SPLD</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSubProd = task.getViewByName( "mSubProd" );
   if ( VmlOperation.isValid( mSubProd ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strSLC_Name;
      String strSLC_Version;
      String strBMBUpdateSLC;
      String strBMBDeleteSLC;
      String strBMBCompareSLC_NextMLC;
      String strBMBCompareSLC_NextMLC_Net;
      String strBMBNewSLC_Version;
      String strBMBMoveSLC_Up;
      String strBMBMoveSLC_Down;
      String strBMBMaintainSPLD;
      
      View vSLC_List;
      vSLC_List = mSubProd.newView( );
      csrRC2 = vSLC_List.cursor( "SubregLabelContent" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vSLC_List.cursor( "SubregLabelContent" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strSLC_Name = "";
         nRC = vSLC_List.cursor( "SubregLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strSLC_Name = vSLC_List.cursor( "SubregLabelContent" ).getStringFromAttribute( "Description", "" );

            if ( strSLC_Name == null )
               strSLC_Name = "";
         }

         if ( StringUtils.isBlank( strSLC_Name ) )
            strSLC_Name = "&nbsp";

         strSLC_Version = "";
         nRC = vSLC_List.cursor( "SubregLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strSLC_Version = vSLC_List.cursor( "SubregLabelContent" ).getStringFromAttribute( "Version", "" );

            if ( strSLC_Version == null )
               strSLC_Version = "";
         }

         if ( StringUtils.isBlank( strSLC_Version ) )
            strSLC_Version = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="EditSubregLabelVersionData( this.id )" id="SLC_Name::<%=strEntityKey%>"><%=strSLC_Name%></a></td>
   <td><a href="#" onclick="EditSubregLabelVersionData( this.id )" id="SLC_Version::<%=strEntityKey%>"><%=strSLC_Version%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateSLC" onclick="EditSubregLabelVersionData( this.id )" id="BMBUpdateSLC::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteSLC" onclick="DeleteSLC( this.id )" id="BMBDeleteSLC::<%=strEntityKey%>"><img src="./images/ePammsDelete.jpg" alt="Delete"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBCompareSLC_NextMLC" onclick="CompareSLC_ToNextMLC( this.id )" id="BMBCompareSLC_NextMLC::<%=strEntityKey%>"><img src="./images/ePammsCompare.jpg" alt="Compare SLC to Next MLC"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBCompareSLC_NextMLC_Net" onclick="CompareSLC_ToNextMLC_Net( this.id )" id="BMBCompareSLC_NextMLC_Net::<%=strEntityKey%>"><img src="./images/ePammsCompare.jpg" alt="Compare SLC to Next MLC (Net)"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBNewSLC_Version" onclick="GenerateNewSLC_Version( this.id )" id="BMBNewSLC_Version::<%=strEntityKey%>"><img src="./images/ePammsNewVersion.jpg" alt="New SLC Version"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveSLC_Up" onclick="MoveSLC_Up( this.id )" id="BMBMoveSLC_Up::<%=strEntityKey%>"><img src="./images/ePammsUp.jpg" alt="Move Up"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveSLC_Down" onclick="MoveSLC_Down( this.id )" id="BMBMoveSLC_Down::<%=strEntityKey%>"><img src="./images/ePammsDown.jpg" alt="Move Down"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMaintainSPLD" onclick="UpdatePhysicalLabel( this.id )" id="BMBMaintainSPLD::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Maintain SPLD"></a></td>

</tr>

<%
         csrRC2 = vSLC_List.cursor( "SubregLabelContent" ).setNextContinue( );
      }
      vSLC_List.drop( );
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

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:18px;height:28px;float:left;">  <!-- GroupBox1 --> 


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
   session.setAttribute( "ZeidonWindow", "wSLCUpdateSubregProduct" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
