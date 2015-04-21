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
         document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "_OnResubmitPage";
         document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "_OnTimeout";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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
         document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "_OnUnload";
         document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

   var szFocusCtrl = document.wStartUpAdminNewPrimaryRegistrant.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpAdminNewPrimaryRegistrant.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpAdminNewPrimaryRegistrant.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpAdminNewPrimaryRegistrant.zOpenFile.value;
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

   var keyRole = document.wStartUpAdminNewPrimaryRegistrant.zKeyRole.value;
   document.wStartUpAdminNewPrimaryRegistrant.zError.value = "";
   document.wStartUpAdminNewPrimaryRegistrant.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wStartUpAdminNewPrimaryRegistrant.hRole.value = document.wStartUpAdminNewPrimaryRegistrant.Role.value
   document.wStartUpAdminNewPrimaryRegistrant.hCBPState.value = document.wStartUpAdminNewPrimaryRegistrant.CBPState.value
   document.wStartUpAdminNewPrimaryRegistrant.hCBState.value = document.wStartUpAdminNewPrimaryRegistrant.CBState.value

   var varTimeout = document.wStartUpAdminNewPrimaryRegistrant.zTimeout.value;
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

function AdminAcceptNewPrimReg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

var szValue = document.wStartUpAdminNewPrimaryRegistrant.EBName.value;
if ( szValue == "" )
{
   alert( "A unique Company Name must be specified" );
   document.wStartUpAdminNewPrimaryRegistrant.EBName.focus();
   return;
}

var szPassword = document.wStartUpAdminNewPrimaryRegistrant.EBPassword.value;
var lPasswordLth = document.wStartUpAdminNewPrimaryRegistrant.EBPassword.value.length;
var szConfirmPassword = document.wStartUpAdminNewPrimaryRegistrant.EBConfirmPassword.value;
if ( lPasswordLth < 8 )
{
   alert( "Password is required to have at least 8 characters" );
   document.wStartUpAdminNewPrimaryRegistrant.EBPassword.focus();
   return;
}

if ( szPassword != szConfirmPassword )
{
   alert( "Password and Confirm Password do not match" );
   document.wStartUpAdminNewPrimaryRegistrant.EBConfirmPassword.focus();
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "AdminAcceptNewPrimReg";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
   }
}

function AdminCancelNewPrimReg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "AdminCancelNewPrimReg";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
   }
}

function AdminAddNewPrimReg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var thisLi;

   // If the Role is not set when we get here, it is because there is no admin (KeyRole = "U"), so we will only permit the user to go to set up the administrator.
//   if ( keyRole == "U" )  // cannot do this since it prevents mapping
//   {
//      thisLi = document.getElementById( "EBCompanyName" );
//      thisLi .disabled = true;
//      thisLi = document.getElementById( "EBLoginName" );
//      thisLi .disabled = true;
//      thisLi = document.getElementById( "CBRole" );
//      thisLi .disabled = true;
//   }

   // From new primary registrant, the only logical top menu option is Logout, so
   // we only leave Logout as an option

      thisLi = document.getElementById( "lmTemplate" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmStateRegistrations" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";

      thisLi = document.getElementById( "lmSubregistrants" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";

      thisLi = document.getElementById( "lmProductManagement" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmMarketingFulfillment" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmAdministration" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmLogin" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";

      // END of Javascript code entered by user.

   }
}

function smAdminAcceptNewPrimReg( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

var szValue = document.wStartUpAdminNewPrimaryRegistrant.EBName.value;
if ( szValue == "" )
{
   alert( "A unique Company Name must be specified" );
   document.wStartUpAdminNewPrimaryRegistrant.EBName.focus();
   return;
}

var szPassword = document.wStartUpAdminNewPrimaryRegistrant.EBPassword.value;
var lPasswordLth = document.wStartUpAdminNewPrimaryRegistrant.EBPassword.value.length;
var szConfirmPassword = document.wStartUpAdminNewPrimaryRegistrant.EBConfirmPassword.value;
if ( lPasswordLth < 8 )
{
   alert( "Password is required to have at least 8 characters" );
   document.wStartUpAdminNewPrimaryRegistrant.EBPassword.focus();
   return;
}

if ( szPassword != szConfirmPassword )
{
   alert( "Password and Confirm Password do not match" );
   document.wStartUpAdminNewPrimaryRegistrant.EBConfirmPassword.focus();
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "smAdminAcceptNewPrimReg";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
   }
}

function smAdminCancelNewPrimReg( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "smAdminCancelNewPrimReg";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mProductManagement";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mSubregistrants";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mStateRegistrations";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mMarketingFulfillment";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mWebDevelopment";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mAdministration";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "mLogin";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
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

      document.wStartUpAdminNewPrimaryRegistrant.zAction.value = "_OnUnload";
      document.wStartUpAdminNewPrimaryRegistrant.submit( );
   }
}

function RoleOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminNewPrimaryRegistrant.hRole.value = document.wStartUpAdminNewPrimaryRegistrant.Role.value;
   }
}

function CBPStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminNewPrimaryRegistrant.hCBPState.value = document.wStartUpAdminNewPrimaryRegistrant.CBPState.value;
   }
}

function CBStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminNewPrimaryRegistrant.hCBState.value = document.wStartUpAdminNewPrimaryRegistrant.CBState.value;
   }
}

