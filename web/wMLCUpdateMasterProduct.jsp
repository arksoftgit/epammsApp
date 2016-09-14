<!DOCTYPE HTML>

<%-- wMLCUpdateMasterProduct   Generate Timestamp: 20160913084222051 --%>

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

   View mMasProd = null;
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

   mMasProd = task.getViewByName( "mMasProd" );
   if ( VmlOperation.isValid( mMasProd ) )
   {
      // MLEdit: MasterProductName
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MasterProductName" );
         task.log().debug( "MasterProductName prior to TrimTinyHtml: " + strMapValue );
         strMapValue = VmlOperation.TrimTinyHtml( strMapValue );
         task.log().debug( "MasterProductName after TrimTinyHtml: '" + strMapValue + "'" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MasterProductName", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MasterProductName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: MasterProductNumber
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MasterProductNumber" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MasterProductNumber", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "Number" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MasterProductNumber", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ChemicalFamily
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hChemicalFamily" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ChemicalFamily", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "ChemicalFamily" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ChemicalFamily", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EstablishmentNumber
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EstablishmentNumber" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EstablishmentNumber", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "EPA_EstablishmentNumber" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EstablishmentNumber", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ToxicityCategory
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hToxicityCategory" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ToxicityCategory", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "EPA_ToxicityCategory" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ToxicityCategory", e.getReason( ), strMapValue );
         }
      }

      // EditBox: ReviewerNote
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "ReviewerNote" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ReviewerNote", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "ReviewerNote" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ReviewerNote", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: MasterProductDescription
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MasterProductDescription" );
         task.log().debug( "MasterProductDescription prior to TrimTinyHtml: " + strMapValue );
         strMapValue = VmlOperation.TrimTinyHtml( strMapValue );
         task.log().debug( "MasterProductDescription after TrimTinyHtml: '" + strMapValue + "'" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MasterProductDescription", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "Description" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MasterProductDescription", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: Footer
      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Footer" );
         task.log().debug( "Footer prior to TrimTinyHtml: " + strMapValue );
         strMapValue = VmlOperation.TrimTinyHtml( strMapValue );
         task.log().debug( "Footer after TrimTinyHtml: '" + strMapValue + "'" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Footer", "", strMapValue );
            else
               mMasProd.cursor( "MasterProduct" ).getAttribute( "Footer" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Footer", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridMasterLabelContent
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasProd.newView( );
      csrRC = vGridTmp.cursor( "MasterLabelContent" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "MasterLabelContent" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "MasterLabelContent" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCUpdateMasterProduct") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCUpdateMasterProduct strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCUpdateMasterProduct LastWindow *** " + strLastWindow );
task.log().info("*** wMLCUpdateMasterProduct LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CANCEL_MasterProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCUpdateMasterProduct", "wMLC.CANCEL_MasterProduct" );
      nOptRC = wMLC.CANCEL_MasterProduct( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_MLC_Version" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mMasProd;
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mMasProd.cursor( "MasterLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasProd.cursor( "MasterLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasProd.cursor( "MasterLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasProd.cursor( "MasterLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DeleteMasterLabelContent" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_CopyMLC_Version" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mMasProd;
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mMasProd.cursor( "MasterLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasProd.cursor( "MasterLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasProd.cursor( "MasterLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasProd.cursor( "MasterLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCUpdateMasterProduct", "wMLC.GOTO_CopyMLC_Version" );
      nOptRC = wMLC.GOTO_CopyMLC_Version( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "VersionCopy" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mMasProd;
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mMasProd.cursor( "MasterLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasProd.cursor( "MasterLabelContent" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasProd.cursor( "MasterLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasProd.cursor( "MasterLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCUpdateMasterProduct", "wMLC.GOTO_UpdateMLC" );
      nOptRC = wMLC.GOTO_UpdateMLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "VersionData" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "NEW_MLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCUpdateMasterProduct", "wMLC.NEW_MLC" );
      nOptRC = wMLC.NEW_MLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "VersionData" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SAVE_MasterProduct" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCUpdateMasterProduct", "wMLC.SAVE_MasterProduct" );
      nOptRC = wMLC.SAVE_MasterProduct( new zVIEW( vKZXMLPGO ) );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCUpdateMasterProduct" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCUpdateMasterProduct" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCUpdateMasterProduct", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCUpdateMasterProduct.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCUpdateMasterProduct.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCUpdateMasterProduct.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCUpdateMasterProduct.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wMLC", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "UpdateMasterProduct", "" );
   }

%>

<html>
<head>

<title>Update Master Product</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>

<!-- TinyMCE -->
<script language="JavaScript" type="text/javascript" src="./js/tinymce/js/tinymce/tinymce.min.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/TinyMCE.js"></script>
<!-- /TinyMCE -->

<script language="JavaScript" type="text/javascript" src="./genjs/wMLCUpdateMasterProduct.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

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
       <li id="SaveAndReturn" name="SaveAndReturn"><a href="#"  onclick="SAVE_MasterProduct()">Save & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CANCEL_MasterProduct()">Cancel & Return</a></li>
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


<form name="wMLCUpdateMasterProduct" id="wMLCUpdateMasterProduct" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "UpdateMasterProduct" );
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
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBStorDispSections5:GroupBox */ %>

<div id="GBStorDispSections5" name="GBStorDispSections5" class="listgroup"   style="float:left;position:relative; width:780px; height:36px;">  <!-- GBStorDispSections5 --> 

<% /* IngredientsText:Text */ %>

<label class="groupbox"  id="IngredientsText" name="IngredientsText" style="width:126px;height:16px;position:absolute;left:6px;top:12px;">Master Product</label>

<% /* PrimaryRegistrant:Text */ %>
<% strTextDisplayValue = "";
   mMasProd = task.getViewByName( "mMasProd" );
   if ( VmlOperation.isValid( mMasProd ) == false )
      task.log( ).debug( "Invalid View: " + "PrimaryRegistrant" );
   else
   {
      nRC = mMasProd.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mMasProd.cursor( "Organization" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PrimaryRegistrant: " + e.getMessage());
         task.log().info( "*** Error on ctrl PrimaryRegistrant" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PrimaryRegistrant" name="PrimaryRegistrant" style="width:370px;height:16px;position:absolute;left:148px;top:12px;"><%=strTextDisplayValue%></label>


</div>  <!--  GBStorDispSections5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBMasterProduct:GroupBox */ %>

<div id="GBMasterProduct" name="GBMasterProduct"   style="float:left;position:relative; width:798px; height:284px;">  <!-- GBMasterProduct --> 

<% /* ProductName::Text */ %>

<label  id="ProductName:" name="ProductName:" style="width:178px;height:16px;position:absolute;left:12px;top:4px;">Name:</label>

<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:578px;height:16px;position:absolute;left:198px;top:4px;">  <!-- GroupBox4 --> 

<% /* MasterProductName:MLEdit */ %>
<%
   // : MasterProductName
   strErrorMapValue = VmlOperation.CheckError( "MasterProductName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) == false )
         task.log( ).info( "Invalid View: " + "MasterProductName" );
      else
      {
         nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "Name" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "MasterProduct.Name: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for MasterProductName: " + "mMasProd.MasterProduct" );
      }
   }
%>

<div style="background-color:#eee;border:1px solid #042;width:578px;height:16px;position:absolute;left:0px;top:0px;overflow:auto;">
<div class="text12 mceSimpleZeidonSpecialCharacters" name="MasterProductName" id="MasterProductName" style="width:578px;height:16px;position:absolute;left:0px;top:0px;"><%=strErrorMapValue%></div></div>


</div>  <!--  GroupBox4 --> 
<% /* ProductNumber::Text */ %>

<label  id="ProductNumber:" name="ProductNumber:" style="width:178px;height:16px;position:absolute;left:12px;top:30px;">Number:</label>

<% /* MasterProductNumber:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "MasterProductNumber", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) == false )
         task.log( ).debug( "Invalid View: " + "MasterProductNumber" );
      else
      {
         nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "Number" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on MasterProductNumber: " + e.getMessage());
               task.log().error( "*** Error on ctrl MasterProductNumber", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MasterProduct.Number: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MasterProductNumber: " + "mMasProd.MasterProduct" );
      }
   }
%>

<input class="text12" name="MasterProductNumber" id="MasterProductNumber" maxlength="32"  title="Product Number within this Registrant"style="width:142px;position:absolute;left:198px;top:30px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* ChemicalFamily::Text */ %>

<label  id="ChemicalFamily:" name="ChemicalFamily:" style="width:178px;height:16px;position:absolute;left:12px;top:56px;">Chemical Family:</label>

<% /* ChemicalFamily:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ChemicalFamily" id="ChemicalFamily" size="1" style="width:210px;position:absolute;left:198px;top:56px;" onchange="ChemicalFamilyOnChange( )">

<%
   boolean inListChemicalFamily = false;

   mMasProd = task.getViewByName( "mMasProd" );
   if ( VmlOperation.isValid( mMasProd ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasProd , "MasterProduct", "ChemicalFamily", "ChemicalFamily" );

      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "ChemicalFamily" ).getString( "" );
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
         inListChemicalFamily = true;
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
               inListChemicalFamily = true;
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
      if ( !inListChemicalFamily )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hChemicalFamily" id="hChemicalFamily" type="hidden" value="<%=strComboCurrentValue%>" >
<% /* EstablishmentNumber::Text */ %>

<label  id="EstablishmentNumber:" name="EstablishmentNumber:" style="width:178px;height:16px;position:absolute;left:12px;top:82px;">EPA Registration Number:</label>

<% /* EstablishmentNumber:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EstablishmentNumber", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) == false )
         task.log( ).debug( "Invalid View: " + "EstablishmentNumber" );
      else
      {
         nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "EPA_EstablishmentNumber" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EstablishmentNumber: " + e.getMessage());
               task.log().error( "*** Error on ctrl EstablishmentNumber", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MasterProduct.EPA_EstablishmentNumber: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EstablishmentNumber: " + "mMasProd.MasterProduct" );
      }
   }
%>

<input class="text12" name="EstablishmentNumber" id="EstablishmentNumber" maxlength="128"  title="EPA Establishment Number"style="width:142px;position:absolute;left:198px;top:82px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* ToxicityCategory::Text */ %>

<label  id="ToxicityCategory:" name="ToxicityCategory:" style="width:178px;height:16px;position:absolute;left:12px;top:108px;">Toxicity Category:</label>

<% /* ToxicityCategory:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ToxicityCategory" id="ToxicityCategory" size="1" style="width:142px;position:absolute;left:198px;top:108px;" onchange="ToxicityCategoryOnChange( )">

<%
   boolean inListToxicityCategory = false;

   mMasProd = task.getViewByName( "mMasProd" );
   if ( VmlOperation.isValid( mMasProd ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasProd , "MasterProduct", "EPA_ToxicityCategory", "" );

      nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "EPA_ToxicityCategory" ).getString( "" );
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
         inListToxicityCategory = true;
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
               inListToxicityCategory = true;
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
      if ( !inListToxicityCategory )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hToxicityCategory" id="hToxicityCategory" type="hidden" value="<%=strComboCurrentValue%>" >
<% /* ReviewerNote::Text */ %>

<label  id="ReviewerNote:" name="ReviewerNote:" style="width:178px;height:16px;position:absolute;left:12px;top:134px;">Reviewer Note:</label>

<% /* ReviewerNote:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "ReviewerNote", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) == false )
         task.log( ).debug( "Invalid View: " + "ReviewerNote" );
      else
      {
         nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "ReviewerNote" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on ReviewerNote: " + e.getMessage());
               task.log().error( "*** Error on ctrl ReviewerNote", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MasterProduct.ReviewerNote: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for ReviewerNote: " + "mMasProd.MasterProduct" );
      }
   }
%>

<input class="text12" name="ReviewerNote" id="ReviewerNote" maxlength="2048"  title="Product Number within this Registrant"style="width:578px;position:absolute;left:198px;top:134px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:772px;height:120px;position:absolute;left:12px;top:160px;">  <!-- GroupBox1 --> 

<% /* Description::Text */ %>

<label  id="Description:" name="Description:" style="width:88px;height:16px;position:absolute;left:0px;top:0px;">Description:</label>

<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:672px;height:48px;position:absolute;left:98px;top:0px;">  <!-- GroupBox2 --> 

<% /* MasterProductDescription:MLEdit */ %>
<%
   // : MasterProductDescription
   strErrorMapValue = VmlOperation.CheckError( "MasterProductDescription", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) == false )
         task.log( ).info( "Invalid View: " + "MasterProductDescription" );
      else
      {
         nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "Description" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "MasterProduct.Description: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for MasterProductDescription: " + "mMasProd.MasterProduct" );
      }
   }
%>

<div style="background-color:#eee;border:1px solid #042;width:668px;height:48px;position:absolute;left:0px;top:0px;overflow:auto;">
<div class="mceSimpleZeidon" name="MasterProductDescription" id="MasterProductDescription" style="width:668px;height:48px;position:absolute;left:0px;top:0px;"><%=strErrorMapValue%></div></div>


</div>  <!--  GroupBox2 --> 
<% /* Footer::Text */ %>

<label  id="Footer:" name="Footer:" style="width:88px;height:16px;position:absolute;left:0px;top:56px;">Footer:</label>

<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:672px;height:64px;position:absolute;left:98px;top:56px;">  <!-- GroupBox3 --> 

<% /* Footer:MLEdit */ %>
<%
   // : Footer
   strErrorMapValue = VmlOperation.CheckError( "Footer", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasProd = task.getViewByName( "mMasProd" );
      if ( VmlOperation.isValid( mMasProd ) == false )
         task.log( ).info( "Invalid View: " + "Footer" );
      else
      {
         nRC = mMasProd.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasProd.cursor( "MasterProduct" ).getAttribute( "Footer" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "MasterProduct.Footer: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for Footer: " + "mMasProd.MasterProduct" );
      }
   }
%>

<div style="background-color:#eee;border:1px solid #042;width:668px;height:64px;position:absolute;left:0px;top:0px;overflow:auto;">
<div class="mceSimpleZeidon" name="Footer" id="Footer" style="width:668px;height:64px;position:absolute;left:0px;top:0px;"><%=strErrorMapValue%></div></div>


</div>  <!--  GroupBox3 --> 

</div>  <!--  GroupBox1 --> 

</div>  <!--  GBMasterProduct --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBMasterLabelContent:GroupBox */ %>

<div id="GBMasterLabelContent" name="GBMasterLabelContent" class="listgroup"   style="float:left;position:relative; width:486px; height:40px;">  <!-- GBMasterLabelContent --> 

<% /* MasterLabelContent:Text */ %>

<label class="listheader"  id="MasterLabelContent" name="MasterLabelContent" style="width:154px;height:16px;position:absolute;left:10px;top:12px;">Master Label Content</label>

<% /* PBNewMasterLabelContent:PushBtn */ %>
<button type="button" class="newbutton" name="PBNewMasterLabelContent" id="PBNewMasterLabelContent" value="" onclick="NEW_MLC( )" style="width:78px;height:26px;position:absolute;left:342px;top:12px;">New</button>


</div>  <!--  GBMasterLabelContent --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridMasterLabelContent:Grid */ %>
<table  cols=7 style=""  name="GridMasterLabelContent" id="GridMasterLabelContent">

<thead><tr>

   <th>Version</th>
   <th>Revision Date</th>
   <th>Prior Version</th>
   <th>Status</th>
   <th>Update</th>
   <th>Delete</th>
   <th>Copy</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mMasProd = task.getViewByName( "mMasProd" );
   if ( VmlOperation.isValid( mMasProd ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridEditVersion;
      String strGridEditRevisionDate;
      String strGridVersion;
      String strGridEditStatus;
      String strBMBUpdateDirectionsUseStatement;
      String strDeleteBtn;
      String strCopyBtn;
      
      View vGridMasterLabelContent;
      vGridMasterLabelContent = mMasProd.newView( );
      csrRC2 = vGridMasterLabelContent.cursor( "MasterLabelContent" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridMasterLabelContent.cursor( "MasterLabelContent" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditVersion = "";
         nRC = vGridMasterLabelContent.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditVersion = vGridMasterLabelContent.cursor( "MasterLabelContent" ).getAttribute( "Version" ).getString( "" );

            if ( strGridEditVersion == null )
               strGridEditVersion = "";
         }

         if ( StringUtils.isBlank( strGridEditVersion ) )
            strGridEditVersion = "&nbsp";

         strGridEditRevisionDate = "";
         nRC = vGridMasterLabelContent.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditRevisionDate = vGridMasterLabelContent.cursor( "MasterLabelContent" ).getAttribute( "RevisionDate" ).getString( "REVMMDDYY" );

            if ( strGridEditRevisionDate == null )
               strGridEditRevisionDate = "";
         }

         if ( StringUtils.isBlank( strGridEditRevisionDate ) )
            strGridEditRevisionDate = "&nbsp";

         strGridVersion = "";
         nRC = vGridMasterLabelContent.cursor( "PreviousMasterLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridVersion = vGridMasterLabelContent.cursor( "PreviousMasterLabelContent" ).getAttribute( "Version" ).getString( "" );

            if ( strGridVersion == null )
               strGridVersion = "";
         }

         if ( StringUtils.isBlank( strGridVersion ) )
            strGridVersion = "&nbsp";

         strGridEditStatus = "";
         nRC = vGridMasterLabelContent.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditStatus = vGridMasterLabelContent.cursor( "MasterLabelContent" ).getAttribute( "Finalized" ).getString( "" );

            if ( strGridEditStatus == null )
               strGridEditStatus = "";
         }

         if ( StringUtils.isBlank( strGridEditStatus ) )
            strGridEditStatus = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><a href="#" onclick="GOTO_UpdateMLC( this.id )" id="GridEditVersion::<%=strEntityKey%>"><%=strGridEditVersion%></a></td>
   <td nowrap><a href="#" onclick="GOTO_UpdateMLC( this.id )" id="GridEditRevisionDate::<%=strEntityKey%>"><%=strGridEditRevisionDate%></a></td>
   <td nowrap><%=strGridVersion%></td>
   <td nowrap><%=strGridEditStatus%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateDirectionsUseStatement" onclick="GOTO_UpdateMLC( this.id )" id="BMBUpdateDirectionsUseStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="DeleteBtn" onclick="DELETE_MLC_Version( this.id )" id="DeleteBtn::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="CopyBtn" onclick="GOTO_CopyMLC_Version( this.id )" id="CopyBtn::<%=strEntityKey%>"><img src="./images/ePammsCopy.png" alt="Copy"></a></td>

</tr>

<%
         csrRC2 = vGridMasterLabelContent.cursor( "MasterLabelContent" ).setNextContinue( );
      }
      vGridMasterLabelContent.drop( );
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
   session.setAttribute( "ZeidonWindow", "wMLCUpdateMasterProduct" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
