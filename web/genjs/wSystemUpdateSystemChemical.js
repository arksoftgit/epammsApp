// wSystemUpdateSystemChemical   Generate Timestamp: 20160620105934449

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
         document.wSystemUpdateSystemChemical.zAction.value = "_OnResubmitPage";
         document.wSystemUpdateSystemChemical.submit( );
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

      document.wSystemUpdateSystemChemical.zAction.value = "_OnTimeout";
      document.wSystemUpdateSystemChemical.submit( );
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
         document.wSystemUpdateSystemChemical.zAction.value = "_OnUnload";
         document.wSystemUpdateSystemChemical.submit( );
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

   var szFocusCtrl = document.wSystemUpdateSystemChemical.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemUpdateSystemChemical.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemUpdateSystemChemical.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemUpdateSystemChemical.zOpenFile.value;
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

   var LoginName = document.wSystemUpdateSystemChemical.zLoginName.value;
   var keyRole = document.wSystemUpdateSystemChemical.zKeyRole.value;
   document.wSystemUpdateSystemChemical.zError.value = "";
   document.wSystemUpdateSystemChemical.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wSystemUpdateSystemChemical.hFamily.value = document.wSystemUpdateSystemChemical.Family.value

   var varTimeout = document.wSystemUpdateSystemChemical.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

var $wai = $("#wai"); if ( $wai ) { $wai.text( document.title ); }
   isWindowClosing = true;
}

function CheckAllInGrid(id, CheckBoxName) // triggered by no text checkbox
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

function AcceptUpdateSystemChemical( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "AcceptUpdateSystemChemical";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function UpdateAppTypesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "UpdateAppTypesList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function CancelUpdateSystemChemical( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "CancelUpdateSystemChemical";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function UpdateLocationsList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "UpdateLocationsList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function UpdateBacteriaList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "UpdateBacteriaList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function UpdateFungiList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "UpdateFungiList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function UpdateVirusesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "UpdateVirusesList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function UpdateSurfacesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "UpdateSurfacesList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function InitSystemChemicalForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "InitSystemChemicalForUpdate";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smUpdateLocationsList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smUpdateLocationsList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smUpdateAppTypesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smUpdateAppTypesList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smUpdateSurfacesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smUpdateSurfacesList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smUpdateBacteriaList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smUpdateBacteriaList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smUpdateFungiList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smUpdateFungiList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smUpdateVirusesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smUpdateVirusesList";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smAcceptUpdateSystemChemical( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smAcceptUpdateSystemChemical";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function smCancelUpdateSystemChemical( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateSystemChemical.zAction.value = "smCancelUpdateSystemChemical";
      document.wSystemUpdateSystemChemical.submit( );
   }
}

function FamilyOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSystemUpdateSystemChemical.hFamily.value = document.wSystemUpdateSystemChemical.Family.value;
   }
}

