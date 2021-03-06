// wMLCMarketingStatement   Generate Timestamp: 20170726200315336

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
         document.wMLCMarketingStatement.zAction.value = "_OnResubmitPage";
         document.wMLCMarketingStatement.submit( );
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

      document.wMLCMarketingStatement.zAction.value = "_OnTimeout";
      document.wMLCMarketingStatement.submit( );
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
         document.wMLCMarketingStatement.zAction.value = "_OnUnload";
         document.wMLCMarketingStatement.submit( );
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

   var szFocusCtrl = document.wMLCMarketingStatement.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCMarketingStatement.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCMarketingStatement.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCMarketingStatement.zOpenFile.value;
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

   var LoginName = document.wMLCMarketingStatement.zLoginName.value;
   var keyRole = document.wMLCMarketingStatement.zKeyRole.value;
   document.wMLCMarketingStatement.zError.value = "";
   document.wMLCMarketingStatement.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCMarketingStatement.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

var $wai = $("#wai"); if ( $wai ) { $wai.text( document.title ); }
   var storageName = "epamms.wMLCMarketingStatement.position";
   var scrollPosition = sessionStorage.getItem( storageName );
   if ( scrollPosition.indexOf('#') > 0 )
   {
      var parts = scrollPosition.split( '#' );
      document.body.scrollTop = parseInt( parts[parts.length - 2] );
      document.body.scrollLeft = parseInt( parts[parts.length - 1] );
   }
   sessionStorage.removeItem(storageName);
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

function AcceptMarketingStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingStatement.zAction.value = "AcceptMarketingStatement";
      document.wMLCMarketingStatement.submit( );
   }
}

function DisplayMarketingStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingStatement.zAction.value = "DisplayMarketingStatement";
      document.wMLCMarketingStatement.submit( );
   }
}

function AcceptNext( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "AcceptNext";
      document.wMLCMarketingStatement.submit( );
   }
}

function AcceptPrevious( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "AcceptPrevious";
      document.wMLCMarketingStatement.submit( );
   }
}

function ADD_MarketingStatementKeyword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "ADD_MarketingStatementKeyword";
      document.wMLCMarketingStatement.submit( );
   }
}

function CancelMarketingStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingStatement.zAction.value = "CancelMarketingStatement";
      document.wMLCMarketingStatement.submit( );
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

      document.wMLCMarketingStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "COPY_InsertKeyword";
      document.wMLCMarketingStatement.submit( );
   }
}

function DELETE_DirectionsForUseStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "DELETE_DirectionsForUseStatement";
      document.wMLCMarketingStatement.submit( );
   }
}

function DELETE_MarketingStatementKeyword( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketingStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "DELETE_MarketingStatementKeyword";
      document.wMLCMarketingStatement.submit( );
   }
}

function GOTO_DirsForUseStatementAdd( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "GOTO_DirsForUseStatementAdd";
      document.wMLCMarketingStatement.submit( );
   }
}

function GOTO_DirsForUseStatementUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "GOTO_DirsForUseStatementUpdate";
      document.wMLCMarketingStatement.submit( );
   }
}

function RefreshMarketing( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "RefreshMarketing";
      document.wMLCMarketingStatement.submit( );
   }
}

function ParseStatementText( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "ParseStatementText";
      document.wMLCMarketingStatement.submit( );
   }
}

function GOTO_MarketingKeywordUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketingStatement.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "GOTO_MarketingKeywordUpdate";
      document.wMLCMarketingStatement.submit( );
   }
}

function GOTO_SelectRemoveMktgEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.




      // END of Javascript code entered by user.

      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "GOTO_SelectRemoveMktgEntries";
      document.wMLCMarketingStatement.submit( );
   }
}

function PASTE_InsertKeyword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "PASTE_InsertKeyword";
      document.wMLCMarketingStatement.submit( );
   }
}

function Sort( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wMLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mMasLC", "M_InsertTextKeywordMarketing", "GridKeywords",  ["Keyword","Keyword Text"]  );

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wMLCMarketingStatement.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCMarketingStatement.zAction.value = "Sort";
      document.wMLCMarketingStatement.submit( );
   }
}

