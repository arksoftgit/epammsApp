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
         document.wStartUpChangeSubregUserPassword.zAction.value = "_OnResubmitPage";
         document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "_OnTimeout";
      document.wStartUpChangeSubregUserPassword.submit( );
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
         document.wStartUpChangeSubregUserPassword.zAction.value = "_OnUnload";
         document.wStartUpChangeSubregUserPassword.submit( );
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

   var szFocusCtrl = document.wStartUpChangeSubregUserPassword.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpChangeSubregUserPassword.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpChangeSubregUserPassword.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpChangeSubregUserPassword.zOpenFile.value;
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

   var keyRole = document.wStartUpChangeSubregUserPassword.zKeyRole.value;
   document.wStartUpChangeSubregUserPassword.zError.value = "";
   document.wStartUpChangeSubregUserPassword.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wStartUpChangeSubregUserPassword.zTimeout.value;
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

function CancelChangeSubregUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpChangeSubregUserPassword.zAction.value = "CancelChangeSubregUserPass";
      document.wStartUpChangeSubregUserPassword.submit( );
   }
}

function ConfirmChangeSubregUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      var strPassword =  document.wStartUpChangeSubregUserPassword.Password.value;
      var strNew =  document.wStartUpChangeSubregUserPassword.NewPassword.value;
      var strConfirm =  document.wStartUpChangeSubregUserPassword.ConfirmPassword.value;

      if ( strPassword == "" )
      {
         alert( "Password must be specified." );
         document.wStartUpChangeSubregUserPassword.Password.focus();
         return;
      }

      if ( strNew == "" || strConfirm == "" )
      {
         alert( "New and Confirmation passwords must be specified." );
         if ( strNew == "" )
            document.wStartUpChangeSubregUserPassword.NewPassword.focus();
         else
            document.wStartUpChangeSubregUserPassword.ConfirmPassword.focus();

         return;
      }

      if ( strNew != strConfirm )
      {
         alert( "New and Confirmation passwords do not match." );
         document.wStartUpChangeSubregUserPassword.NewPassword.focus();
         return;
      }

      if ( strNew.length < 8 )
      {
         alert( "New passwords must contain at least 8 characters." );
         document.wStartUpChangeSubregUserPassword.NewPassword.focus();
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpChangeSubregUserPassword.zAction.value = "ConfirmChangeSubregUserPass";
      document.wStartUpChangeSubregUserPassword.submit( );
   }
}

function InitChangeSubregUserPass( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   if ( keyRole == "S" )
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

   }
}

function smConfirmChangeSubregUserPass( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

      var strPassword =  document.wStartUpChangeSubregUserPassword.Password.value;
      var strNew =  document.wStartUpChangeSubregUserPassword.NewPassword.value;
      var strConfirm =  document.wStartUpChangeSubregUserPassword.ConfirmPassword.value;

      if ( strPassword == "" )
      {
         alert( "Password must be specified." );
         document.wStartUpChangeSubregUserPassword.Password.focus();
         return;
      }

      if ( strNew == "" || strConfirm == "" )
      {
         alert( "New and Confirmation passwords must be specified." );
         if ( strNew == "" )
            document.wStartUpChangeSubregUserPassword.NewPassword.focus();
         else
            document.wStartUpChangeSubregUserPassword.ConfirmPassword.focus();

         return;
      }

      if ( strNew != strConfirm )
      {
         alert( "New and Confirmation passwords do not match." );
         document.wStartUpChangeSubregUserPassword.NewPassword.focus();
         return;
      }

      if ( strNew.length < 8 )
      {
         alert( "New passwords must contain at least 8 characters." );
         document.wStartUpChangeSubregUserPassword.NewPassword.focus();
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpChangeSubregUserPassword.zAction.value = "smConfirmChangeSubregUserPass";
      document.wStartUpChangeSubregUserPassword.submit( );
   }
}

function smCancelChangeSubregUserPass( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpChangeSubregUserPassword.zAction.value = "smCancelChangeSubregUserPass";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mProductManagement";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mSubregistrants";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mStateRegistrations";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mMarketingFulfillment";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mWebDevelopment";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mAdministration";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "mLogin";
      document.wStartUpChangeSubregUserPassword.submit( );
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

      document.wStartUpChangeSubregUserPassword.zAction.value = "_OnUnload";
      document.wStartUpChangeSubregUserPassword.submit( );
   }
}

