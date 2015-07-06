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
         document.wStartUpChangePrimRegUserPassword.zAction.value = "_OnResubmitPage";
         document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "_OnTimeout";
      document.wStartUpChangePrimRegUserPassword.submit( );
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
         document.wStartUpChangePrimRegUserPassword.zAction.value = "_OnUnload";
         document.wStartUpChangePrimRegUserPassword.submit( );
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

   var szFocusCtrl = document.wStartUpChangePrimRegUserPassword.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpChangePrimRegUserPassword.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpChangePrimRegUserPassword.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpChangePrimRegUserPassword.zOpenFile.value;
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

   var keyRole = document.wStartUpChangePrimRegUserPassword.zKeyRole.value;
   document.wStartUpChangePrimRegUserPassword.zError.value = "";
   document.wStartUpChangePrimRegUserPassword.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wStartUpChangePrimRegUserPassword.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   // From this subwindow, the only logical top menu option is Logout, so
   // we leave Logout as the only option.
   var thisLi;
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
      thisLi = document.getElementById( "lmWebDevelopment" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmCompanyProfile" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmLogin" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmLogout" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none"
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

function CancelChangePrimRegUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpChangePrimRegUserPassword.zAction.value = "CancelChangePrimRegUserPass";
      document.wStartUpChangePrimRegUserPassword.submit( );
   }
}

function ConfirmChangePrimRegUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      var strPassword =  document.wStartUpChangePrimRegUserPassword.Password.value;
      var strNew =  document.wStartUpChangePrimRegUserPassword.NewPassword.value;
      var strConfirm =  document.wStartUpChangePrimRegUserPassword.ConfirmPassword.value;

      if ( strPassword == "" )
      {
         alert( "Password must be specified." );
         document.wStartUpChangePrimRegUserPassword.Password.focus();
         return;
      }

      if ( strNew == "" || strConfirm == "" )
      {
         alert( "New and Confirmation passwords must be specified." );
         if ( strNew == "" )
            document.wStartUpChangePrimRegUserPassword.NewPassword.focus();
         else
            document.wStartUpChangePrimRegUserPassword.ConfirmPassword.focus();

         return;
      }

      if ( strNew != strConfirm )
      {
         alert( "New and Confirmation passwords do not match." );
         document.wStartUpChangePrimRegUserPassword.NewPassword.focus();
         return;
      }

      if ( strNew.length < 8 )
      {
         alert( "New passwords must contain at least 8 characters." );
         document.wStartUpChangePrimRegUserPassword.NewPassword.focus();
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpChangePrimRegUserPassword.zAction.value = "ConfirmChangePrimRegUserPass";
      document.wStartUpChangePrimRegUserPassword.submit( );
   }
}

function InitChangePrimRegUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
   }
}

function smConfirmChangePrimRegUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

      var strPassword =  document.wStartUpChangePrimRegUserPassword.Password.value;
      var strNew =  document.wStartUpChangePrimRegUserPassword.NewPassword.value;
      var strConfirm =  document.wStartUpChangePrimRegUserPassword.ConfirmPassword.value;

      if ( strPassword == "" )
      {
         alert( "Password must be specified." );
         document.wStartUpChangePrimRegUserPassword.Password.focus();
         return;
      }

      if ( strNew == "" || strConfirm == "" )
      {
         alert( "New and Confirmation passwords must be specified." );
         if ( strNew == "" )
            document.wStartUpChangePrimRegUserPassword.NewPassword.focus();
         else
            document.wStartUpChangePrimRegUserPassword.ConfirmPassword.focus();

         return;
      }

      if ( strNew != strConfirm )
      {
         alert( "New and Confirmation passwords do not match." );
         document.wStartUpChangePrimRegUserPassword.NewPassword.focus();
         return;
      }

      if ( strNew.length < 8 )
      {
         alert( "New passwords must contain at least 8 characters." );
         document.wStartUpChangePrimRegUserPassword.NewPassword.focus();
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpChangePrimRegUserPassword.zAction.value = "smConfirmChangePrimRegUserPass";
      document.wStartUpChangePrimRegUserPassword.submit( );
   }
}

function smCancelChangePrimRegUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpChangePrimRegUserPassword.zAction.value = "smCancelChangePrimRegUserPass";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mProductManagement";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mSubregistrants";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mStateRegistrations";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mMarketingFulfillment";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mWebDevelopment";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mCompanyProfile";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "mLogin";
      document.wStartUpChangePrimRegUserPassword.submit( );
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

      document.wStartUpChangePrimRegUserPassword.zAction.value = "_OnUnload";
      document.wStartUpChangePrimRegUserPassword.submit( );
   }
}

