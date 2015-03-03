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
         document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "_OnResubmitPage";
         document.wStartUpAdminDeletePrimaryRegistrant.submit( );
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

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "_OnTimeout";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
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
         document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "_OnUnload";
         document.wStartUpAdminDeletePrimaryRegistrant.submit( );
      }
   }
}

function _IsDocDisabled( )
{
   var bRC = false;

   var $el = $("#zDisable");
   if ( $el.length > 0 ) {
      bRC = $el.attr( "disabled" );
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

   var $el = $("#zDisable");
   if ( $el.length > 0 ) {
      $el.attr( "disabled", bDisabled );
      bRC = true;
   }

   $.blockUI({ message: '<h1><img src="./images/busy.gif" /></h1>', overlayCSS: { backgroundColor: '#eee' } });
   return bRC;
}

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wStartUpAdminDeletePrimaryRegistrant.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpAdminDeletePrimaryRegistrant.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpAdminDeletePrimaryRegistrant.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpAdminDeletePrimaryRegistrant.zOpenFile.value;
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

   var keyRole = document.wStartUpAdminDeletePrimaryRegistrant.zKeyRole.value;
   document.wStartUpAdminDeletePrimaryRegistrant.zError.value = "";
   document.wStartUpAdminDeletePrimaryRegistrant.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wStartUpAdminDeletePrimaryRegistrant.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   isWindowClosing = true;
}

function CheckAllInGrid(id, CheckBoxName)
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

function AdminCancelDelPrimReg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "AdminCancelDelPrimReg";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function AdminConfirmDeletePrimReg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "AdminConfirmDeletePrimReg";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function AdminInitDeletePrimReg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "AdminInitDeletePrimReg";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function smAdminConfirmDeletePrimReg( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "smAdminConfirmDeletePrimReg";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function smAdminCancelDelPrimReg( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "smAdminCancelDelPrimReg";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mProductManagement( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmProductManagement" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mProductManagement";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mSubregistrants( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmSubregistrants" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mSubregistrants";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mTrackingNotificationCompliance( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mStateRegistrations( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmStateRegistrations" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mStateRegistrations";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mMarketingFulfillment( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmMarketingFulfillment" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mMarketingFulfillment";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mWebDevelopment( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmWebDevelopment" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mWebDevelopment";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mAdministration( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmAdministration" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mAdministration";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mLogin( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmLogin" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "mLogin";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmLogout" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminDeletePrimaryRegistrant.zAction.value = "_OnUnload";
      document.wStartUpAdminDeletePrimaryRegistrant.submit( );
   }
}

