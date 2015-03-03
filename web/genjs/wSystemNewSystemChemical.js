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
         document.wSystemNewSystemChemical.zAction.value = "_OnResubmitPage";
         document.wSystemNewSystemChemical.submit( );
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

      document.wSystemNewSystemChemical.zAction.value = "_OnTimeout";
      document.wSystemNewSystemChemical.submit( );
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
         document.wSystemNewSystemChemical.zAction.value = "_OnUnload";
         document.wSystemNewSystemChemical.submit( );
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

   var szFocusCtrl = document.wSystemNewSystemChemical.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemNewSystemChemical.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemNewSystemChemical.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemNewSystemChemical.zOpenFile.value;
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

   var keyRole = document.wSystemNewSystemChemical.zKeyRole.value;
   document.wSystemNewSystemChemical.zError.value = "";
   document.wSystemNewSystemChemical.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wSystemNewSystemChemical.hFamily.value = document.wSystemNewSystemChemical.Family.value

   var varTimeout = document.wSystemNewSystemChemical.zTimeout.value;
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

function InitSystemChemicalForInsert( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   thisLi = document.getElementById( "lmSystem" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

      // END of Javascript code entered by user.

   }
}

function AcceptNewSystemChemicalAndRtn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "AcceptNewSystemChemicalAndRtn";
      document.wSystemNewSystemChemical.submit( );
   }
}

function CancelNewChemicalAndRtn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "CancelNewChemicalAndRtn";
      document.wSystemNewSystemChemical.submit( );
   }
}

function smAcceptNewSystemChemicalAndRtn( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "smAcceptNewSystemChemicalAndRtn";
      document.wSystemNewSystemChemical.submit( );
   }
}

function smCancelNewChemicalAndRtn( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "smCancelNewChemicalAndRtn";
      document.wSystemNewSystemChemical.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "mTemplate";
      document.wSystemNewSystemChemical.submit( );
   }
}

function mSystem( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "mSystem";
      document.wSystemNewSystemChemical.submit( );
   }
}

function mShowFeedback( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "mShowFeedback";
      document.wSystemNewSystemChemical.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemNewSystemChemical.zAction.value = "_OnUnload";
      document.wSystemNewSystemChemical.submit( );
   }
}

function FamilyOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSystemNewSystemChemical.hFamily.value = document.wSystemNewSystemChemical.Family.value;
   }
}

