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
         document.wStartUpAdminUpdateSubregistrant.zAction.value = "_OnResubmitPage";
         document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "_OnTimeout";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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
         document.wStartUpAdminUpdateSubregistrant.zAction.value = "_OnUnload";
         document.wStartUpAdminUpdateSubregistrant.submit( );
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

   var szFocusCtrl = document.wStartUpAdminUpdateSubregistrant.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpAdminUpdateSubregistrant.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpAdminUpdateSubregistrant.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpAdminUpdateSubregistrant.zOpenFile.value;
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

   var LoginName = document.wStartUpAdminUpdateSubregistrant.zLoginName.value;
   var keyRole = document.wStartUpAdminUpdateSubregistrant.zKeyRole.value;
   document.wStartUpAdminUpdateSubregistrant.zError.value = "";
   document.wStartUpAdminUpdateSubregistrant.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wStartUpAdminUpdateSubregistrant.hCBPState.value = document.wStartUpAdminUpdateSubregistrant.CBPState.value
   document.wStartUpAdminUpdateSubregistrant.hCBState.value = document.wStartUpAdminUpdateSubregistrant.CBState.value

   var varTimeout = document.wStartUpAdminUpdateSubregistrant.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   var thisLi;

   thisLi = document.getElementById( "lmCompanyProfile" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none"
   if ( keyRole == "Subregistrant" ) // if we are a Subregistrant
   {
      thisLi = document.getElementById( "lmSubregistrants" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
    }
   else
   if ( keyRole == "Primary Registrant" ) // if we are a Primary Registrant
   {
      thisLi = document.getElementById( "lmStateRegistrations" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }

   // Cannot go to subregistrant maintenance if already there.
   thisLi = document.getElementById( "lmSubregistrants" );
   thisLi.disabled = true;
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

function AdminAcceptUpdateSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

var szValue = document.wStartUpAdminUpdateSubregistrant.EBName.value;
if ( szValue == "" )
{
   alert( "A unique Company Name must be specified" );
   document.wStartUpAdminUpdateSubregistrant.EBName.focus();
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "AdminAcceptUpdateSubreg";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function AdminCancelUpdateSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "AdminCancelUpdateSubreg";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function ChangeSubregPassword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "ChangeSubregPassword";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function InitSubregistrantForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminUpdateSubregistrant.zAction.value = "InitSubregistrantForUpdate";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function Profile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "Profile";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function smChangeSubregPassword( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "smChangeSubregPassword";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function smProfile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "smProfile";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function smAdminAcceptUpdateSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

var szValue = document.wStartUpAdminUpdateSubregistrant.EBName.value;
if ( szValue == "" )
{
   alert( "A unique Company Name must be specified" );
   document.wStartUpAdminUpdateSubregistrant.EBName.focus();
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "smAdminAcceptUpdateSubreg";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function smAdminCancelUpdateSubreg( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "smAdminCancelUpdateSubreg";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mProductManagement";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mSubregistrants";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mStateRegistrations";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mMarketingFulfillment";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mWebDevelopment";
      document.wStartUpAdminUpdateSubregistrant.submit( );
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

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mCompanyProfile";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function mUsers( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminUpdateSubregistrant.zAction.value = "mUsers";
      document.wStartUpAdminUpdateSubregistrant.submit( );
   }
}

function CBPStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminUpdateSubregistrant.hCBPState.value = document.wStartUpAdminUpdateSubregistrant.CBPState.value;
   }
}

function CBStateOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminUpdateSubregistrant.hCBState.value = document.wStartUpAdminUpdateSubregistrant.CBState.value;
   }
}

