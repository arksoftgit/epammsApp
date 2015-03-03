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
         document.wSPLDSPLD_BlockSpecialFormatDef.zAction.value = "_OnResubmitPage";
         document.wSPLDSPLD_BlockSpecialFormatDef.submit( );
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

      document.wSPLDSPLD_BlockSpecialFormatDef.zAction.value = "_OnTimeout";
      document.wSPLDSPLD_BlockSpecialFormatDef.submit( );
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
         document.wSPLDSPLD_BlockSpecialFormatDef.zAction.value = "_OnUnload";
         document.wSPLDSPLD_BlockSpecialFormatDef.submit( );
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

   var szFocusCtrl = document.wSPLDSPLD_BlockSpecialFormatDef.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSPLDSPLD_BlockSpecialFormatDef.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSPLDSPLD_BlockSpecialFormatDef.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSPLDSPLD_BlockSpecialFormatDef.zOpenFile.value;
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

   var keyRole = document.wSPLDSPLD_BlockSpecialFormatDef.zKeyRole.value;
   document.wSPLDSPLD_BlockSpecialFormatDef.zError.value = "";
   document.wSPLDSPLD_BlockSpecialFormatDef.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox2.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox2.value
   document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox3.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox3.value
   document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox4.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox4.value
   document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox5.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox5.value
   document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox7.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox7.value
   document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox10.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox10.value

   var varTimeout = document.wSPLDSPLD_BlockSpecialFormatDef.zTimeout.value;
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

function ACCEPT_BlockSpecialFormat( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockSpecialFormatDef.zAction.value = "ACCEPT_BlockSpecialFormat";
      document.wSPLDSPLD_BlockSpecialFormatDef.submit( );
   }
}

function PostbuildBlockSpecialFormatDef( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockSpecialFormatDef.zAction.value = "PostbuildBlockSpecialFormatDef";
      document.wSPLDSPLD_BlockSpecialFormatDef.submit( );
   }
}

function CANCEL_BlockComponent( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockSpecialFormatDef.zAction.value = "CANCEL_BlockComponent";
      document.wSPLDSPLD_BlockSpecialFormatDef.submit( );
   }
}

function ComboBox1OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox1.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox1.selectedIndex;
   }
}

function ComboBox2OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox2.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox2.value;
   }
}

function ComboBox3OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox3.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox3.value;
   }
}

function ComboBox4OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox4.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox4.value;
   }
}

function ComboBox5OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox5.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox5.value;
   }
}

function ComboBox7OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox7.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox7.value;
   }
}

function ComboBox10OnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockSpecialFormatDef.hComboBox10.value = document.wSPLDSPLD_BlockSpecialFormatDef.ComboBox10.value;
   }
}

