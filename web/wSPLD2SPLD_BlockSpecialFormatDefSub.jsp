<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wSPLD2SPLD_BlockSpecialFormatDefSub --%>

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
      // ComboBox: ComboBox1
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) )
      {
         nRC = mSPLDef.cursor( "SpecialFormattingSelectEntry" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hComboBox1" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               mSPLDef.cursor( "SpecialFormattingSelectEntry" ).setPosition( nRelPos, "" );
            }
         }  // checkExistenceofEntity
      }

      // EditBox: EditBox6
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox6" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox6", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "MarginTop", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox6", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox7
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox7" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox7", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "MarginBottom", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox7", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox8
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox8" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox8", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "MarginLeft", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox8", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox9
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox9" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox9", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "MarginRight", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox9", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox2
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox2", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "TextAlign", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox2", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox3
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox3", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "FontFamily", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox3", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox4
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox4" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox4", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "FontSize", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox4", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox5
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox5" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox5", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "FontWeight", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox5", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox6
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox6" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox6", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "Color", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox6", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox7
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox7" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox7", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "BorderStyle", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox7", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox10
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox10" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox10", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "BorderWidth", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox10", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox8
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox8" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox8", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "BorderColor", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox8", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox9
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox9" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox9", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "TitlePosition", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox9", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: CheckBox1
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "CheckBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CheckBox1", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).setAttribute( "CapitalizeTitleTextFlag", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CheckBox1", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wSPLD2SPLD_BlockSpecialFormatDefSub") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSPLD2_Dialog wSPLD2 = new wSPLD2_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSPLD2SPLD_BlockSpecialFormatDefSub strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSPLD2SPLD_BlockSpecialFormatDefSub LastWindow *** " + strLastWindow );
task.log().info("*** wSPLD2SPLD_BlockSpecialFormatDefSub LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ACCEPT_BlockSpecialFormat" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLD2SPLD_BlockSpecialFormatDefSub", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp", "wSPLD2.ACCEPT_BlockSpecialFormat" );
      try
      {
         nOptRC = wSPLD2.ACCEPT_BlockSpecialFormat( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation ACCEPT_BlockSpecialFormat: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLD2SPLD_BlockSpecialFormatDefSub" );
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
         strLastPage = "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CANCEL_BlockComponent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLD2SPLD_BlockSpecialFormatDefSub", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp", "wSPLD2.CANCEL_BlockSpecialFormat" );
      try
      {
         nOptRC = wSPLD2.CANCEL_BlockSpecialFormat( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CANCEL_BlockSpecialFormat: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wSPLD2SPLD_BlockSpecialFormatDefSub" );
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
         strLastPage = "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSPLD2SPLD_BlockSpecialFormatDefSub" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSPLD2SPLD_BlockSpecialFormatDefSub" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLD2SPLD_BlockSpecialFormatDefSub", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSPLD2SPLD_BlockSpecialFormatDefSub.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLD2SPLD_BlockSpecialFormatDefSub.jsp", "wSPLD2.PostbuildBlockSpecialFormatDef" );
   nOptRC = wSPLD2.PostbuildBlockSpecialFormatDef( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wSPLD2SPLD_BlockSpecialFormatDefSub.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSPLD2" +
                         "&OperationName=" + "PostbuildBlockSpecialFormatDef";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSPLD2", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

%>

<html>
<head>

<title>SPLD_BlockSpecialFormatDefSub</title>

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
<script language="JavaScript" type="text/javascript" src="./genjs/wSPLD2SPLD_BlockSpecialFormatDefSub.js"></script>

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
       <li><a href="#"  onclick="ACCEPT_BlockSpecialFormat( )">Accept and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="CANCEL_BlockComponent( )">Cancel and Return</a></li>
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


<form name="wSPLD2SPLD_BlockSpecialFormatDefSub" id="wSPLD2SPLD_BlockSpecialFormatDefSub" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View lSPLDLST = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mPrimReg = null;
   View mSPLDef = null;
   View mSubLC = null;
   View mSubProd = null;
   View mSubreg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSPLD2", "SPLD_BlockSpecialFormatDefSub" );
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
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:456px;" >

<table cols=3 style="width:456px;"  class="grouptable">

<tr>
<td valign="top" style="width:136px;">
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:130px;height:26px;">Formatting Type:</span>

</td>
<td valign="top" style="width:192px;">
<% /* ComboBox1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox1" id="ComboBox1" size="1"style="width:192px;" onchange="ComboBox1OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
         strComboCurrentValue = "";
      View vComboBox1;
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) )
      {
         nRC = mSPLDef.cursor( "SpecialFormattingSelectEntry" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mSPLDef.cursor( "SpecialFormattingSelectEntry" ).getStringFromAttribute( "KeywordName", "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vComboBox1 = mSPLDef.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";
      csrRC = vComboBox1.cursor( "SpecialFormattingSelectEntry" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vComboBox1.cursor( "SpecialFormattingSelectEntry" ).getStringFromAttribute( "KeywordName", "" );
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
         csrRC =  vComboBox1.cursor( "SpecialFormattingSelectEntry" ).setNextContinue( );
      }

      vComboBox1.drop( );

   }
%>
</select>
<input name="hComboBox1" id="hComboBox1" type="hidden" value="<%=strComboSelectedValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text8:Text */ %>

<span  id="Text8" name="Text8" style="width:130px;height:26px;">Top Margin:</span>

</td>
<td valign="top" style="width:136px;">
<% /* EditBox6:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox6", strError );
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
         task.log( ).debug( "Invalid View: " + "EditBox6" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "MarginTop", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox6: " + e.getMessage());
               task.log().info( "*** Error on ctrl EditBox6" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrSubBlock.MarginTop: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_SpecialSectionAttrSubBlock" );
      }
   }
%>

<input name="EditBox6" id="EditBox6" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* Text21:Text */ %>

<span  id="Text21" name="Text21" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text10:Text */ %>

<span  id="Text10" name="Text10" style="width:130px;height:26px;">Bottom Margin:</span>

</td>
<td valign="top" style="width:136px;">
<% /* EditBox7:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox7", strError );
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
         task.log( ).debug( "Invalid View: " + "EditBox7" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "MarginBottom", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox7: " + e.getMessage());
               task.log().info( "*** Error on ctrl EditBox7" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrSubBlock.MarginBottom: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_SpecialSectionAttrSubBlock" );
      }
   }
%>

<input name="EditBox7" id="EditBox7" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* Text22:Text */ %>

<span  id="Text22" name="Text22" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text11:Text */ %>

<span  id="Text11" name="Text11" style="width:130px;height:26px;">Left Margin:</span>

</td>
<td valign="top" style="width:136px;">
<% /* EditBox8:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox8", strError );
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
         task.log( ).debug( "Invalid View: " + "EditBox8" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "MarginLeft", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox8: " + e.getMessage());
               task.log().info( "*** Error on ctrl EditBox8" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrSubBlock.MarginLeft: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_SpecialSectionAttrSubBlock" );
      }
   }
%>

<input name="EditBox8" id="EditBox8" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* Text23:Text */ %>

<span  id="Text23" name="Text23" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text12:Text */ %>

<span  id="Text12" name="Text12" style="width:130px;height:26px;">Right Margin:</span>

</td>
<td valign="top" style="width:136px;">
<% /* EditBox9:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox9", strError );
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
         task.log( ).debug( "Invalid View: " + "EditBox9" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "MarginRight", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox9: " + e.getMessage());
               task.log().info( "*** Error on ctrl EditBox9" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrSubBlock.MarginRight: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_SpecialSectionAttrSubBlock" );
      }
   }
%>

<input name="EditBox9" id="EditBox9" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* Text24:Text */ %>

<span  id="Text24" name="Text24" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text13:Text */ %>

<span  id="Text13" name="Text13" style="width:130px;height:28px;">Text Alignment:</span>

</td>
<td valign="top" style="width:98px;">
<% /* ComboBox2:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox2" id="ComboBox2" size="1" style="width:98px;" onchange="ComboBox2OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "TextAlign", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "TextAlign", "" );
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

<input name="hComboBox2" id="hComboBox2" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text14:Text */ %>

<span  id="Text14" name="Text14" style="width:130px;height:30px;">Font Family:</span>

</td>
<td valign="top" style="width:98px;">
<% /* ComboBox3:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox3" id="ComboBox3" size="1" style="width:98px;" onchange="ComboBox3OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "FontFamily", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "FontFamily", "" );
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

<input name="hComboBox3" id="hComboBox3" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text15:Text */ %>

<span  id="Text15" name="Text15" style="width:130px;height:30px;">Font Size:</span>

</td>
<td valign="top" style="width:98px;">
<% /* ComboBox4:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox4" id="ComboBox4" size="1" style="width:98px;" onchange="ComboBox4OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "FontSize", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "FontSize", "" );
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

<input name="hComboBox4" id="hComboBox4" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text16:Text */ %>

<span  id="Text16" name="Text16" style="width:130px;height:30px;">Font Weight:</span>

</td>
<td valign="top" style="width:98px;">
<% /* ComboBox5:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox5" id="ComboBox5" size="1" style="width:98px;" onchange="ComboBox5OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "FontWeight", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "FontWeight", "" );
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

<input name="hComboBox5" id="hComboBox5" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text17:Text */ %>

<span  id="Text17" name="Text17" style="width:130px;height:30px;">Font Color:</span>

</td>
<td valign="top" style="width:98px;">
<% /* ComboBox6:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox6" id="ComboBox6" size="1" style="width:98px;" onchange="ComboBox6OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "Color", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "Color", "" );
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

<input name="hComboBox6" id="hComboBox6" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text18:Text */ %>

<span  id="Text18" name="Text18" style="width:130px;height:30px;">Border Style:</span>

</td>
<td valign="top" style="width:98px;">
<% /* ComboBox7:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox7" id="ComboBox7" size="1" style="width:98px;" onchange="ComboBox7OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "BorderStyle", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "BorderStyle", "" );
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

<input name="hComboBox7" id="hComboBox7" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text19:Text */ %>

<span  id="Text19" name="Text19" style="width:130px;height:30px;">Border Width:</span>

</td>
<td valign="top" style="width:136px;">
<% /* EditBox10:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox10", strError );
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
         task.log( ).debug( "Invalid View: " + "EditBox10" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "BorderWidth", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox10: " + e.getMessage());
               task.log().info( "*** Error on ctrl EditBox10" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrSubBlock.BorderWidth: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_SpecialSectionAttrSubBlock" );
      }
   }
%>

<input name="EditBox10" id="EditBox10" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* Text25:Text */ %>

<span  id="Text25" name="Text25" style="width:128px;height:26px;">  (Ex. 1.0)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text20:Text */ %>

<span  id="Text20" name="Text20" style="width:130px;height:30px;">Border Color:</span>

</td>
<td valign="top" style="width:126px;">
<% /* ComboBox8:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox8" id="ComboBox8" size="1" style="width:126px;" onchange="ComboBox8OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "BorderColor", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "BorderColor", "" );
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

<input name="hComboBox8" id="hComboBox8" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Text2:Text */ %>

<span  id="Text2" name="Text2" style="width:130px;height:30px;">Title Position:</span>

</td>
<td valign="top" style="width:252px;">
<% /* ComboBox9:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox9" id="ComboBox9" size="1" style="width:252px;" onchange="ComboBox9OnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDef , "LLD_SpecialSectionAttrSubBlock", "TitlePosition", "" );

      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "TitlePosition", "" );
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

<input name="hComboBox9" id="hComboBox9" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp</span>
<% /* CheckBox1:CheckBox */ %>
<%
   strErrorMapValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "CheckBox1" );
   else
   {
      nRC = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mSPLDef.cursor( "LLD_SpecialSectionAttrSubBlock" ).getStringFromAttribute( "CapitalizeTitleTextFlag" );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="CheckBox1" id="CheckBox1"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:230px;height:24px;">&nbsp Convert Text to All Capitals</span>

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
   session.setAttribute( "ZeidonWindow", "wSPLD2SPLD_BlockSpecialFormatDefSub" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
