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
         document.wStartUpUserLogin.zAction.value = "_OnResubmitPage";
         document.wStartUpUserLogin.submit( );
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

      document.wStartUpUserLogin.zAction.value = "_OnTimeout";
      document.wStartUpUserLogin.submit( );
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
         // These lines are commented out because either we are registering zeidon on this
         // window or this is a popup window so we don't want to do an unload if the user
         // closes the window using the red close button.
         //document.wStartUpUserLogin.zAction.value = "_OnUnload";
         //document.wStartUpUserLogin.submit( );
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

function _OnEnter( e )
{
   var keycode;
   if ( window.event )
      keycode = window.event.keyCode;
   else
   {
      if ( e )
         keycode = e.which;
      else
         return true;
   }

   if ( keycode == 13 )
   {
      ProcessUserLogin( );
      return false;
   }
   else
      return true;
   }

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wStartUpUserLogin.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpUserLogin.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpUserLogin.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpUserLogin.zOpenFile.value;
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

   var LoginName = document.wStartUpUserLogin.zLoginName.value;
   var keyRole = document.wStartUpUserLogin.zKeyRole.value;
   document.wStartUpUserLogin.zError.value = "";
   document.wStartUpUserLogin.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wStartUpUserLogin.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   document.getElementById( "EBUserName" ).value = localStorage.getItem( "epamms_user" );
   document.getElementById( "EBRegistrantName" ).value = localStorage.getItem( "epamms_registrant" );
   var e1 = document.getElementById( "PrimaryRegistrants" );
   e1.value = localStorage.getItem( "epamms_organization" );
   var e2 = document.getElementById( "hPrimaryRegistrants" );
   e2.value = e1.selectedIndex;

/* var thisLi;

   // If the Role is not set when we get here, it is because there is no admin (KeyRole = "U"), so we will only permit the user to go to set up the administrator.
   if ( keyRole == "U" )
   {
      thisLi = document.getElementById( "EBRegistrantName" );
      thisLi .disabled = true;
      thisLi = document.getElementById( "EBUserName" );
      thisLi .disabled = true;
      thisLi = document.getElementById( "EBPassword" );
      thisLi .disabled = true;
      thisLi = document.getElementById( "CBRole" );
      thisLi .disabled = true;
      thisLi = document.getElementById( "PBLogin");
      thisLi.style.visibility = "hidden";
   }
   else
   {
      thisLi = document.getElementById( "PBSetupAdmin" );
      thisLi.style.visibility = "hidden";
   }
*/
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

function AutoLogin( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "AutoLogin";
      document.wStartUpUserLogin.submit( );
   }
}

function FORGOT_Password( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "FORGOT_Password";
      document.wStartUpUserLogin.submit( );
   }
}

function InitLoginWindow( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpUserLogin.zAction.value = "InitLoginWindow";
      document.wStartUpUserLogin.submit( );
   }
}

function Logout( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "_OnUnload";
      document.wStartUpUserLogin.submit( );
   }
}

function ProcessUserLogin( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   localStorage.setItem( "epamms_user", document.getElementById( "EBUserName" ).value );
   localStorage.setItem( "epamms_registrant", document.getElementById( "EBRegistrantName" ).value );
   var e = document.getElementById("PrimaryRegistrants");
   localStorage.setItem( "epamms_organization", e.options[e.selectedIndex].text );

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "ProcessUserLogin";
      document.wStartUpUserLogin.submit( );
   }
}

function mLogout( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "_OnUnload";
      document.wStartUpUserLogin.submit( );
   }
}

function PrimaryRegistrantsOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpUserLogin.hPrimaryRegistrants.value = document.wStartUpUserLogin.PrimaryRegistrants.selectedIndex;
   }
}

