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

   var keyRole = document.wStartUpUserLogin.zKeyRole.value;
   document.wStartUpUserLogin.zError.value = "";
   document.wStartUpUserLogin.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wStartUpUserLogin.hCBRole.value = document.wStartUpUserLogin.CBRole.value

   var varTimeout = document.wStartUpUserLogin.zTimeout.value;
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

function AdministratorLogin( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "AdministratorLogin";
      document.wStartUpUserLogin.submit( );
   }
}

function FORGOT_Password( )
{
   orderByNewIndex( arrayOrderIndex0, arrayOriginal0 );
   korderbyIndex( karrayOrderIndex0, karrayOriginal0 );
   orderByNewIndex( arrayOrderIndex1, arrayOriginal1 );
   korderbyIndex( karrayOrderIndex1, karrayOriginal1 );
   orderByNewIndex( arrayOrderIndex2, arrayOriginal2 );
   korderbyIndex( karrayOrderIndex2, karrayOriginal2 );
   orderByNewIndex( arrayOrderIndex3, arrayOriginal3 );
   korderbyIndex( karrayOrderIndex3, karrayOriginal3 );

   var arrHeader = [ "NickName", "ProperName", "Description" ];
   var myWindow = openSortWin( "Nick Names", "viewName", "entityName", arrHeader, null );

/*
Order index: 1, 2, 4, 3, 5, 6, 0
wStartUpUserLogin.js:313 Original array: A, B, C, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 1 to: 0   B, A, C, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 2 to: 1   B, C, A, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 4 to: 2   B, C, E, A, D, F, G
wStartUpUserLogin.js:335 After move (with shift: 1) from: 3 to: 3   B, C, E, D, A, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 5 to: 4   B, C, E, D, F, A, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 6 to: 5   B, C, E, D, F, G, A
wStartUpUserLogin.js:349 Swaps: 6  final array: B, C, E, D, F, G, A
wStartUpUserLogin.js:358 Expected final array: B, C, E, D, F, G, A
wStartUpUserLogin.js:391 final karray swaps(11): B, C, E, D, F, G, A
wStartUpUserLogin.js:306 Order index: 6, 0, 1, 2, 3, 4, 5
wStartUpUserLogin.js:313 Original array: A, B, C, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 6 to: 0   G, A, B, C, D, E, F
wStartUpUserLogin.js:349 Swaps: 1  final array: G, A, B, C, D, E, F
wStartUpUserLogin.js:358 Expected final array: G, A, B, C, D, E, F
wStartUpUserLogin.js:391 final karray swaps(1): G, A, B, C, D, E, F
wStartUpUserLogin.js:306 Order index: 1, 2, 3, 4, 5, 6, 0
wStartUpUserLogin.js:313 Original array: A, B, C, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 1 to: 0   B, A, C, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 2 to: 1   B, C, A, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 3 to: 2   B, C, D, A, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 4 to: 3   B, C, D, E, A, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 5 to: 4   B, C, D, E, F, A, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 6 to: 5   B, C, D, E, F, G, A
wStartUpUserLogin.js:349 Swaps: 6  final array: B, C, D, E, F, G, A
wStartUpUserLogin.js:358 Expected final array: B, C, D, E, F, G, A
wStartUpUserLogin.js:391 final karray swaps(6): B, C, D, E, F, G, A
wStartUpUserLogin.js:306 Order index: 0, 1, 3, 2, 4, 6, 5
wStartUpUserLogin.js:313 Original array: A, B, C, D, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 3 to: 2   A, B, D, C, E, F, G
wStartUpUserLogin.js:335 After move (with shift: 0) from: 6 to: 5   A, B, D, C, E, G, F
wStartUpUserLogin.js:349 Swaps: 2  final array: A, B, D, C, E, G, F
wStartUpUserLogin.js:358 Expected final array: A, B, D, C, E, G, F
wStartUpUserLogin.js:391 final karray swaps(6): A, B, D, C, E, G, F
*/
   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "FORGOT_Password";
      document.wStartUpUserLogin.submit( );
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

function InitLoginWindow( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

  var thisLi;

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

      // END of Javascript code entered by user.

   }
}

function ProcessUserLogin( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpUserLogin.zAction.value = "ProcessUserLogin";
      document.wStartUpUserLogin.submit( );
   }
}

function mmLogout( )
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

function CBRoleOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpUserLogin.hCBRole.value = document.wStartUpUserLogin.CBRole.value;
   }
}

