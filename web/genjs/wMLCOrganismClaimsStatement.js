// wMLCOrganismClaimsStatement   Generate Timestamp: 20160914154445889

var isWindowClosing = true;
var timerID = null;
onerror = handleErr;
window.history.forward( 1 );
var Tab;

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
         document.wMLCOrganismClaimsStatement.zAction.value = "_OnResubmitPage";
         document.wMLCOrganismClaimsStatement.submit( );
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

      document.wMLCOrganismClaimsStatement.zAction.value = "_OnTimeout";
      document.wMLCOrganismClaimsStatement.submit( );
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
         document.wMLCOrganismClaimsStatement.zAction.value = "_OnUnload";
         document.wMLCOrganismClaimsStatement.submit( );
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

   var szFocusCtrl = document.wMLCOrganismClaimsStatement.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCOrganismClaimsStatement.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCOrganismClaimsStatement.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCOrganismClaimsStatement.zOpenFile.value;
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

   var LoginName = document.wMLCOrganismClaimsStatement.zLoginName.value;
   var keyRole = document.wMLCOrganismClaimsStatement.zKeyRole.value;
   document.wMLCOrganismClaimsStatement.zError.value = "";
   document.wMLCOrganismClaimsStatement.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wMLCOrganismClaimsStatement.hUsage.value = document.wMLCOrganismClaimsStatement.Usage.value

   var varTimeout = document.wMLCOrganismClaimsStatement.zTimeout.value;
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

function AcceptAndNextUsage( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "AcceptAndNextUsage";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function AcceptAndPreviousUsage( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "AcceptAndPreviousUsage";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function AcceptAndReturnClaimsStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "AcceptAndReturnClaimsStatement";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function ADD_BlankClaimsKeywordAndText( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "ADD_BlankClaimsKeywordAndText";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function ADD_UsageKeyword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "ADD_UsageKeyword";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function AttemptDecipheredEntry( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "AttemptDecipheredEntry";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function CancelClaimsStmt( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "CancelClaimsStmt";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function COPY_UsageKeywordAndText( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCOrganismClaimsStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "COPY_UsageKeywordAndText";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function DELETE_UsageKeyword( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCOrganismClaimsStatement.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

// Confirmation of  Delete.
if (!confirm("OK to delete selected entry?"))
{
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "DELETE_UsageKeyword";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function GOTO_DisplayGeneratedTextUsage( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "GOTO_DisplayGeneratedTextUsage";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function GOTO_UsageUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCOrganismClaimsStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "GOTO_UsageUpdate";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function PASTE_UsageKeywordAndText( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "PASTE_UsageKeywordAndText";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function SaveAddNewUsage( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaimsStatement.zAction.value = "SaveAddNewUsage";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

function UsageOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wMLCOrganismClaimsStatement.hUsage.value = document.wMLCOrganismClaimsStatement.Usage.value;
   }
}

function UsageFootnoteOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wMLCOrganismClaimsStatement.hUsageFootnote.value = document.wMLCOrganismClaimsStatement.UsageFootnote.selectedIndex;
      document.wMLCOrganismClaimsStatement.zAction.value = "ZEIDON_ComboBoxSubmit";
      document.wMLCOrganismClaimsStatement.submit( );
   }
}

