// wMLCDirectionsForUseCategory   Generate Timestamp: 20160914154444233

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
         document.wMLCDirectionsForUseCategory.zAction.value = "_OnResubmitPage";
         document.wMLCDirectionsForUseCategory.submit( );
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

      document.wMLCDirectionsForUseCategory.zAction.value = "_OnTimeout";
      document.wMLCDirectionsForUseCategory.submit( );
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
         document.wMLCDirectionsForUseCategory.zAction.value = "_OnUnload";
         document.wMLCDirectionsForUseCategory.submit( );
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

   var szFocusCtrl = document.wMLCDirectionsForUseCategory.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCDirectionsForUseCategory.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCDirectionsForUseCategory.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCDirectionsForUseCategory.zOpenFile.value;
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

   var LoginName = document.wMLCDirectionsForUseCategory.zLoginName.value;
   var keyRole = document.wMLCDirectionsForUseCategory.zKeyRole.value;
   document.wMLCDirectionsForUseCategory.zError.value = "";
   document.wMLCDirectionsForUseCategory.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCDirectionsForUseCategory.zTimeout.value;
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

function GOTO_DirsForUseSectionDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCDirectionsForUseCategory.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "GOTO_DirsForUseSectionDelete";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function AddNewDFU_Category( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "AddNewDFU_Category";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function GOTO_DirsForUseSectionUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCDirectionsForUseCategory.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "GOTO_DirsForUseSectionUpdate";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function GOTO_DU_SectionAdd( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "GOTO_DU_SectionAdd";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function Sort( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wMLCDirectionsForUseCategory.zTableRowSelect.value = buildSortTableHtml( "mMasLC", "M_DirectionsForUseSection", "GridDirectionsForUseCategories",  ["Name","Title"]  );

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "Sort";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function AcceptDirectionsUseCategory( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

if ( document.wMLCDirectionsForUseCategory.DirectionsUseName == "" ) {
   alert( "CategoryName is required" );
   return 0;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "AcceptDirectionsUseCategory";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function AcceptNext( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "AcceptNext";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function AcceptPrevious( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "AcceptPrevious";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function CancelDirectionsUseCategory( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "CancelDirectionsUseCategory";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function DELETE_DirectionsForUseStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "DELETE_DirectionsForUseStatement";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function GOTO_DirsForUseStatementAdd( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "GOTO_DirsForUseStatementAdd";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

function GOTO_DirsForUseStatementUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUseCategory.zAction.value = "GOTO_DirsForUseStatementUpdate";
      document.wMLCDirectionsForUseCategory.submit( );
   }
}

