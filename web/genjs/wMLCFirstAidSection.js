// wMLCFirstAidSection   Generate Timestamp: 20170516151426943

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
         document.wMLCFirstAidSection.zAction.value = "_OnResubmitPage";
         document.wMLCFirstAidSection.submit( );
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

      document.wMLCFirstAidSection.zAction.value = "_OnTimeout";
      document.wMLCFirstAidSection.submit( );
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
         document.wMLCFirstAidSection.zAction.value = "_OnUnload";
         document.wMLCFirstAidSection.submit( );
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

   var szFocusCtrl = document.wMLCFirstAidSection.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCFirstAidSection.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCFirstAidSection.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCFirstAidSection.zOpenFile.value;
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

   var LoginName = document.wMLCFirstAidSection.zLoginName.value;
   var keyRole = document.wMLCFirstAidSection.zKeyRole.value;
   document.wMLCFirstAidSection.zError.value = "";
   document.wMLCFirstAidSection.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCFirstAidSection.zTimeout.value;
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

function GOTO_AddFirstAidStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "GOTO_AddFirstAidStatement";
      document.wMLCFirstAidSection.submit( );
   }
}

function Refresh( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "Refresh";
      document.wMLCFirstAidSection.submit( );
   }
}

function GOTO_FirstAidStmtDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCFirstAidSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "GOTO_FirstAidStmtDelete";
      document.wMLCFirstAidSection.submit( );
   }
}

function GOTO_UpdateFirstAidStmt( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCFirstAidSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "GOTO_UpdateFirstAidStmt";
      document.wMLCFirstAidSection.submit( );
   }
}

function smSaveMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smSaveMLC";
      document.wMLCFirstAidSection.submit( );
   }
}

function smSaveAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smSaveAndReturnMLC";
      document.wMLCFirstAidSection.submit( );
   }
}

function smCancelAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smCancelAndReturnMLC";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditIngredientsSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditIngredientsSect";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditHumanHazardSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditHumanHazardSect";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditFirstAidSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditFirstAidSect";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditStorDispSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditStorDispSect";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditDirectionsUseSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditDirectionsUseSect";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditPrecautionarySection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditPrecautionarySection";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEnvironmentalHazards( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEnvironmentalHazards";
      document.wMLCFirstAidSection.submit( );
   }
}

function smGOTO_DilutionEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smGOTO_DilutionEntries";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditSurfacesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditSurfacesSection";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditLocationsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditLocationsSection";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditApplicationTypesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditApplicationTypesSection";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditClaimsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditClaimsSection";
      document.wMLCFirstAidSection.submit( );
   }
}

function smGOTO_ClaimsFootnote( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smGOTO_ClaimsFootnote";
      document.wMLCFirstAidSection.submit( );
   }
}

function smEditMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smEditMarketingSect";
      document.wMLCFirstAidSection.submit( );
   }
}

function smTables( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCFirstAidSection.zAction.value = "smTables";
      document.wMLCFirstAidSection.submit( );
   }
}

