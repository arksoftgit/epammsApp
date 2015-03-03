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
         document.wSLCOrganismClaims.zAction.value = "_OnResubmitPage";
         document.wSLCOrganismClaims.submit( );
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

      document.wSLCOrganismClaims.zAction.value = "_OnTimeout";
      document.wSLCOrganismClaims.submit( );
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
         document.wSLCOrganismClaims.zAction.value = "_OnUnload";
         document.wSLCOrganismClaims.submit( );
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

   var szFocusCtrl = document.wSLCOrganismClaims.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSLCOrganismClaims.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSLCOrganismClaims.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSLCOrganismClaims.zOpenFile.value;
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

   var keyRole = document.wSLCOrganismClaims.zKeyRole.value;
   document.wSLCOrganismClaims.zError.value = "";
   document.wSLCOrganismClaims.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSLCOrganismClaims.zTimeout.value;
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

function GOTO_SelectClaimsUsageEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.




      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "GOTO_SelectClaimsUsageEntries";
      document.wSLCOrganismClaims.submit( );
   }
}

function smSaveAndReturnMLC( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smSaveAndReturnMLC";
      document.wSLCOrganismClaims.submit( );
   }
}

function smSaveSLC( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smSaveSLC";
      document.wSLCOrganismClaims.submit( );
   }
}

function smCancelAndReturnSLC( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smCancelAndReturnSLC";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayVersionData( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayVersionData";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayIngredientsSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayIngredientsSect";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayStorDispSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayStorDispSect";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayHumanHazardSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayHumanHazardSect";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayPrecautionarySection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayPrecautionarySection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayFirstAidSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayFirstAidSection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayHazardSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayHazardSection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayClaimsSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayClaimsSection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplaySurfacesSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplaySurfacesSection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayAreasOfUseSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayAreasOfUseSection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayApplicationTypesSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayApplicationTypesSection";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayDirectionsUseSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayDirectionsUseSect";
      document.wSLCOrganismClaims.submit( );
   }
}

function smDisplayMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCOrganismClaims.zAction.value = "smDisplayMarketingSect";
      document.wSLCOrganismClaims.submit( );
   }
}

