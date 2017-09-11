// wSLCEnvironmentalHazards   Generate Timestamp: 20170809164830517

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
         document.wSLCEnvironmentalHazards.zAction.value = "_OnResubmitPage";
         document.wSLCEnvironmentalHazards.submit( );
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

      document.wSLCEnvironmentalHazards.zAction.value = "_OnTimeout";
      document.wSLCEnvironmentalHazards.submit( );
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
         document.wSLCEnvironmentalHazards.zAction.value = "_OnUnload";
         document.wSLCEnvironmentalHazards.submit( );
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

   var szFocusCtrl = document.wSLCEnvironmentalHazards.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSLCEnvironmentalHazards.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSLCEnvironmentalHazards.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSLCEnvironmentalHazards.zOpenFile.value;
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

   var LoginName = document.wSLCEnvironmentalHazards.zLoginName.value;
   var keyRole = document.wSLCEnvironmentalHazards.zKeyRole.value;
   document.wSLCEnvironmentalHazards.zError.value = "";
   document.wSLCEnvironmentalHazards.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSLCEnvironmentalHazards.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

var $wai = $("#wai"); if ( $wai ) { $wai.text( document.title ); }
   var storageName = "epamms.wSLCEnvironmentalHazards.position";
   var scrollPosition = sessionStorage.getItem( storageName );
   if ( scrollPosition.indexOf('#') > 0 )
   {
      var parts = scrollPosition.split( '#' );
      document.body.scrollTop = parseInt( parts[parts.length - 2] );
      document.body.scrollLeft = parseInt( parts[parts.length - 1] );
   }
   sessionStorage.removeItem(storageName);
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

function EnvironmentalHazardsSection( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSLCEnvironmentalHazards.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for sessionStorage.
         var storageName = "epamms.wSLCEnvironmentalHazards.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wSLCEnvironmentalHazards.zAction.value = "EnvironmentalHazardsSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smSaveAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smSaveAndReturnMLC";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smSaveSLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smSaveSLC";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smCancelAndReturnSLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smCancelAndReturnSLC";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayVersionData( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayVersionData";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayIngredientsSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayIngredientsSect";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayHumanHazardSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayHumanHazardSect";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayFirstAidSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayFirstAidSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayStorDispSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayStorDispSect";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayDirectionsUseSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayDirectionsUseSect";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayPrecautionarySection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayPrecautionarySection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayHazardSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayHazardSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDilution( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDilution";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplaySurfacesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplaySurfacesSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayLocationsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayLocationsSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayApplicationTypesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayApplicationTypesSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayClaimsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayClaimsSection";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smGOTO_Footnotes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smGOTO_Footnotes";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayMarketingSect";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

function smDisplayTables( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCEnvironmentalHazards.zAction.value = "smDisplayTables";
      document.wSLCEnvironmentalHazards.submit( );
   }
}

