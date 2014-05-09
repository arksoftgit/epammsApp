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
         document.wStartUpAdminNewSubregistrant.zAction.value = "_OnResubmitPage";
         document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "_OnTimeout";
      document.wStartUpAdminNewSubregistrant.submit( );
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
         document.wStartUpAdminNewSubregistrant.zAction.value = "_OnUnload";
         document.wStartUpAdminNewSubregistrant.submit( );
      }
   }
}

function _IsDocDisabled( )
{
   var theForm;
   var j;
   var k;

   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         if ( theForm.elements[ k ].name == "zDisable" )
            return theForm.elements[ k ].disabled;
      }
   }

   return false;
}

function _DisableFormElements( bDisabled )
{
   var theForm;
   var type;
   var lis;
   var thisLi;
   var j;
   var k;
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

   // We want to set some fields as disabled (like buttons and comboboxes) so that
   // while the jsp code is processing, users can not select these controls.
   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         type = theForm.elements[ k ].type;

         if ( type == "button" || type == "submit" || (type != null && type.indexOf( "select" ) == 0) )
         {
            theForm.elements[ k ].disabled = bDisabled;
         }
         else
         if ( theForm.elements[ k ].name == "zDisable" )
         {
            theForm.elements[ k ].disabled = bDisabled;
            bRC = true;
         }
      }
   }

   lis = document.getElementsByTagName( "li" );
   for ( k = 0; k < lis.length; k++ )
   {
      thisLi = lis[ k ];
      thisLi.disabled = bDisabled;
   }

   return bRC;
}

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wStartUpAdminNewSubregistrant.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpAdminNewSubregistrant.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpAdminNewSubregistrant.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpAdminNewSubregistrant.zOpenFile.value;
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

   var keyRole = document.wStartUpAdminNewSubregistrant.zKeyRole.value;
   document.wStartUpAdminNewSubregistrant.zError.value = "";
   document.wStartUpAdminNewSubregistrant.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wStartUpAdminNewSubregistrant.hCBPState.value = document.wStartUpAdminNewSubregistrant.CBPState.value
   document.wStartUpAdminNewSubregistrant.hCBState.value = document.wStartUpAdminNewSubregistrant.CBState.value

   var varTimeout = document.wStartUpAdminNewSubregistrant.zTimeout.value;
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

function AdminAcceptNewSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

var szValue = document.wStartUpAdminNewSubregistrant.EBName.value;
if ( szValue == "" )
{
   alert( "A unique Company Name must be specified" );
   document.wStartUpAdminNewSubregistrant.EBName.focus();
   return;
}

szValue = document.wStartUpAdminNewSubregistrant.EBLoginName.value;
if ( szValue == "" )
{
   alert( "A unique Login Name must be specified" );
   document.wStartUpAdminNewSubregistrant.EBLoginName.focus();
   return;
}

var szPassword = document.wStartUpAdminNewSubregistrant.EBPassword.value;
var lPasswordLth = document.wStartUpAdminNewSubregistrant.EBPassword.value.length;
var szConfirmPassword = document.wStartUpAdminNewSubregistrant.EBConfirmPassword.value;
if ( lPasswordLth < 8 )
{
   alert( "Password is required to have at least 8 characters" );
   document.wStartUpAdminNewSubregistrant.EBPassword.focus();
   return;
}

if ( szPassword != szConfirmPassword )
{
   alert( "Password and Confirm Password do not match" );
   document.wStartUpAdminNewSubregistrant.EBConfirmPassword.focus();
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminNewSubregistrant.zAction.value = "AdminAcceptNewSubreg";
      document.wStartUpAdminNewSubregistrant.submit( );
   }
}

function AdminCancelNewSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminNewSubregistrant.zAction.value = "AdminCancelNewSubreg";
      document.wStartUpAdminNewSubregistrant.submit( );
   }
}

function AdminAddNewSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

 // From new primary registrant, the only logical top menu option is Logout, so
   // we only leave Logout as an option
   var thisLi;

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

function smAdminAcceptNewSubreg( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

var szValue = document.wStartUpAdminNewSubregistrant.EBName.value;
if ( szValue == "" )
{
   alert( "A unique Company Name must be specified" );
   document.wStartUpAdminNewSubregistrant.EBName.focus();
   return;
}

szValue = document.wStartUpAdminNewSubregistrant.EBLoginName.value;
if ( szValue == "" )
{
   alert( "A unique Login Name must be specified" );
   document.wStartUpAdminNewSubregistrant.EBLoginName.focus();
   return;
}

var szPassword = document.wStartUpAdminNewSubregistrant.EBPassword.value;
var lPasswordLth = document.wStartUpAdminNewSubregistrant.EBPassword.value.length;
var szConfirmPassword = document.wStartUpAdminNewSubregistrant.EBConfirmPassword.value;
if ( lPasswordLth < 8 )
{
   alert( "Password is required to have at least 8 characters" );
   document.wStartUpAdminNewSubregistrant.EBPassword.focus();
   return;
}

if ( szPassword != szConfirmPassword )
{
   alert( "Password and Confirm Password do not match" );
   document.wStartUpAdminNewSubregistrant.EBConfirmPassword.focus();
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminNewSubregistrant.zAction.value = "smAdminAcceptNewSubreg";
      document.wStartUpAdminNewSubregistrant.submit( );
   }
}

function smAdminCancelNewSubreg( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminNewSubregistrant.zAction.value = "smAdminCancelNewSubreg";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mProductManagement";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mSubregistrants";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mStateRegistrations";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mMarketingFulfillment";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mWebDevelopment";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mAdministration";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "mLogin";
      document.wStartUpAdminNewSubregistrant.submit( );
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

      document.wStartUpAdminNewSubregistrant.zAction.value = "_OnUnload";
      document.wStartUpAdminNewSubregistrant.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmTemplate" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminNewSubregistrant.zAction.value = "mTemplate";
      document.wStartUpAdminNewSubregistrant.submit( );
   }
}

function CBPStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminNewSubregistrant.hCBPState.value = document.wStartUpAdminNewSubregistrant.CBPState.value;
   }
}

function CBStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminNewSubregistrant.hCBState.value = document.wStartUpAdminNewSubregistrant.CBState.value;
   }
}

