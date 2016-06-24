// wMLCStorageDisposalStatement   Generate Timestamp: 20160623140110332

var isWindowClosing = true;
var timerID = null;
onerror = handleErr;
window.history.forward( 1 );

function handleErr( msg, url, l )
{
   var txt = "There was an error on this page.\n\n";
   txt += "Error: " + msg + "\n";
   txt += "URL: " + url + "\n";
   txt += "Line: " + l + "\n\n";
   txt += "Click OK to continue.\n\n";
// alert( txt );
   return true;
}

// This function returns Internet Explorer's major version number,
// or 0 for others. It works by finding the "MSIE " string and
// extracting the version number following the space, up to the decimal
// point, ignoring the minor version number.
function msieversion( )
{
   var ua = window.navigator.userAgent;
   var msie = ua.indexOf( "MSIE " );

   if ( msie > 0 )      // if Internet Explorer, return version number
      return parseInt( ua.substring( msie + 5, ua.indexOf( ".", msie ) ) );
   else                 // if another browser, return 0
      return 0;
}

function _OnAlmostTimeout()
{
   if ( _IsDocDisabled( ) == false )
   {
      var tStart   = new Date();

      alert( "Your session will timeout in one minute.  Please click 'OK' within that time to continue and save your work if necessary." )

      var tEnd   = new Date();
      var tDiff = tEnd.getTime() - tStart.getTime();

      // If the time is less than one minute, resubmit the page.  Otherwise, go to the timeout window.
      if (tDiff < 60000)
      {
         document.wMLCStorageDisposalStatement.zAction.value = "_OnResubmitPage";
         document.wMLCStorageDisposalStatement.submit( );
      }
      else
      {
         _OnTimeout( );
      }
   }
}

function _OnTimeout( )
{
   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "_OnTimeout";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function _BeforePageUnload( )
{
   if ( _IsDocDisabled( ) == false )
   {
      // If the user clicked on the window close box, then
      // isWindowClosing will be true.  Otherwise if the user
      // clicked on something else in the page, isWindowClosing will be false.
      // If the user clicked the window close box, unregister zeidon.
      if (isWindowClosing)
      {
         document.wMLCStorageDisposalStatement.zAction.value = "_OnUnload";
         document.wMLCStorageDisposalStatement.submit( );
      }
   }
}

function _IsDocDisabled( )
{
   var bRC = false;

   var $el = $("#zDisable");
   if ( $el.length > 0 ) {
      bRC = $el[0].disabled;
   }
   return bRC ? true : false;
}

function _DisableFormElements( bDisabled )
{
   var bRC = false;

   if ( bDisabled && timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   // Controls on the window may have been set as disabled through javascript but
   // when we try to get the values for these controls in jsp (response.getParameter)
   // they will always be null.  Set any disabled fields to enabled for this reason.
   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         if (theForm.elements[ k ].disabled == true)
             theForm.elements[ k ].disabled = false;
      }
   }

   var $el = $("#zDisable");
   if ( $el.length > 0 ) {
      $el[0].disabled = true;
      bRC = true;
   }

   $.blockUI({ message: '<h1><img src="./images/busy.gif" /></h1>', overlayCSS: { backgroundColor: '#eee' } });
   return bRC;
}

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wMLCStorageDisposalStatement.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCStorageDisposalStatement.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCStorageDisposalStatement.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCStorageDisposalStatement.zOpenFile.value;
   if ( szMsg != "" )
   {
      var NewWin = window.open( szMsg );
      if ( NewWin )
         NewWin.focus( );
      else
      {
         alert( "Pop-up windows are being blocked.  You need to set your browser to allow pop-ups from this site for this action to work." );
      }
   }

   var LoginName = document.wMLCStorageDisposalStatement.zLoginName.value;
   var keyRole = document.wMLCStorageDisposalStatement.zKeyRole.value;
   document.wMLCStorageDisposalStatement.zError.value = "";
   document.wMLCStorageDisposalStatement.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wMLCStorageDisposalStatement.hCBSize.value = document.wMLCStorageDisposalStatement.CBSize.value
   document.wMLCStorageDisposalStatement.hCBType.value = document.wMLCStorageDisposalStatement.CBType.value

   var varTimeout = document.wMLCStorageDisposalStatement.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

var $wai = $("#wai"); if ( $wai ) { $wai.text( document.title ); }
   isWindowClosing = true;
}

function CheckAllInGrid(id, CheckBoxName) // triggered by no text checkbox
{
   var wcontrols = id.form.elements;
   var check = id.checked;
   var wcontrol, i = 0;

   while ( (wcontrol = wcontrols[ i++ ]) != null )
   {
      //Check to see if the checkbox belongs to this table then check it.
      if ( wcontrol.name.indexOf( CheckBoxName ) != -1 && wcontrol.type == 'checkbox' )
      {
         wcontrol.checked = check;
      }
   }
}

function AcceptAddNewStorDispStmt( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "AcceptAddNewStorDispStmt";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function GOTO_StorageDispSubStatementAdd( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "GOTO_StorageDispSubStatementAdd";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function GOTO_StorageDispStatementDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCStorageDisposalStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "GOTO_StorageDispStatementDelete";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function GOTO_StorageDispStatementUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCStorageDisposalStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "GOTO_StorageDispStatementUpdate";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function AcceptStorDispStmt( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "AcceptStorDispStmt";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function ADD_SD_StatementKeyword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "ADD_SD_StatementKeyword";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function CancelStorDispStmt( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "CancelStorDispStmt";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function COPY_InsertKeyword( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCStorageDisposalStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "COPY_InsertKeyword";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function DELETE_DS_StatementKeyword( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCStorageDisposalStatement.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

// Confirmation of  Delete.
if (!confirm("OK to delete selected entry?"))
{
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "DELETE_DS_StatementKeyword";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function GOTO_DisplayGeneratedTextSD( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "GOTO_DisplayGeneratedTextSD";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function GOTO_DU_KeywordUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCStorageDisposalStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "GOTO_DU_KeywordUpdate";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function PASTE_InsertKeyword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCStorageDisposalStatement.zAction.value = "PASTE_InsertKeyword";
      document.wMLCStorageDisposalStatement.submit( );
   }
}

function CBSizeOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wMLCStorageDisposalStatement.hCBSize.value = document.wMLCStorageDisposalStatement.CBSize.value;
   }
}

function CBTypeOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wMLCStorageDisposalStatement.hCBType.value = document.wMLCStorageDisposalStatement.CBType.value;
   }
}

