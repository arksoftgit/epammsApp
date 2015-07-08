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
         document.wStartUpAdminUpdateSubregUser.zAction.value = "_OnResubmitPage";
         document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "_OnTimeout";
      document.wStartUpAdminUpdateSubregUser.submit( );
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
         document.wStartUpAdminUpdateSubregUser.zAction.value = "_OnUnload";
         document.wStartUpAdminUpdateSubregUser.submit( );
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

   var szFocusCtrl = document.wStartUpAdminUpdateSubregUser.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpAdminUpdateSubregUser.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpAdminUpdateSubregUser.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpAdminUpdateSubregUser.zOpenFile.value;
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

   var keyRole = document.wStartUpAdminUpdateSubregUser.zKeyRole.value;
   document.wStartUpAdminUpdateSubregUser.zError.value = "";
   document.wStartUpAdminUpdateSubregUser.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wStartUpAdminUpdateSubregUser.hExperienceLevel.value = document.wStartUpAdminUpdateSubregUser.ExperienceLevel.value
   document.wStartUpAdminUpdateSubregUser.hCBPState.value = document.wStartUpAdminUpdateSubregUser.CBPState.value

   var varTimeout = document.wStartUpAdminUpdateSubregUser.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmLogout" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none"

   if ( keyRole == "Subregistrant" )
   {
      thisLi = document.getElementById( "lmSubregistrants" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }
   else
   {
      thisLi = document.getElementById( "lmStateRegistrations" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }
   // END of Javascript code entered by user.

var $wai = $("#wai"); if ( $wai ) { $wai.text( document.title ); }
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

function AcceptUpdateSubregUser( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "AcceptUpdateSubregUser";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function CancelUpdateSubregUser( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "CancelUpdateSubregUser";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function InitSubregUserForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminUpdateSubregUser.zAction.value = "InitSubregUserForUpdate";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function Profile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "Profile";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function smProfile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "smProfile";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function smAcceptUpdateSubregUser( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "smAcceptUpdateSubregUser";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function smCancelUpdateSubregUser( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "smCancelUpdateSubregUser";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mProductManagement";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mSubregistrants";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mStateRegistrations";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mMarketingFulfillment";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mWebDevelopment";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function mCompanyProfile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmCompanyProfile" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mCompanyProfile";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "mLogin";
      document.wStartUpAdminUpdateSubregUser.submit( );
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

      document.wStartUpAdminUpdateSubregUser.zAction.value = "_OnUnload";
      document.wStartUpAdminUpdateSubregUser.submit( );
   }
}

function ExperienceLevelOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminUpdateSubregUser.hExperienceLevel.value = document.wStartUpAdminUpdateSubregUser.ExperienceLevel.value;
   }
}

function CBPStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminUpdateSubregUser.hCBPState.value = document.wStartUpAdminUpdateSubregUser.CBPState.value;
   }
}

