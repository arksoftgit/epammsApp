// wMLCOrganismClaims   Generate Timestamp: 20160531205228944

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
         document.wMLCOrganismClaims.zAction.value = "_OnResubmitPage";
         document.wMLCOrganismClaims.submit( );
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

      document.wMLCOrganismClaims.zAction.value = "_OnTimeout";
      document.wMLCOrganismClaims.submit( );
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
         document.wMLCOrganismClaims.zAction.value = "_OnUnload";
         document.wMLCOrganismClaims.submit( );
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

   var szFocusCtrl = document.wMLCOrganismClaims.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCOrganismClaims.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCOrganismClaims.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCOrganismClaims.zOpenFile.value;
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

   var LoginName = document.wMLCOrganismClaims.zLoginName.value;
   var keyRole = document.wMLCOrganismClaims.zKeyRole.value;
   document.wMLCOrganismClaims.zError.value = "";
   document.wMLCOrganismClaims.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCOrganismClaims.zTimeout.value;
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

function GOTO_AddUsageStatements( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "GOTO_AddUsageStatements";
      document.wMLCOrganismClaims.submit( );
   }
}

function AttemptEmbedKeywords( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "AttemptEmbedKeywords";
      document.wMLCOrganismClaims.submit( );
   }
}

function GOTO_DeleteSelectedEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "GOTO_DeleteSelectedEntries";
      document.wMLCOrganismClaims.submit( );
   }
}

function GOTO_UpdateClaimsStatement( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCOrganismClaims.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "GOTO_UpdateClaimsStatement";
      document.wMLCOrganismClaims.submit( );
   }
}

function smSaveAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smSaveAndReturnMLC";
      document.wMLCOrganismClaims.submit( );
   }
}

function smSaveMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smSaveMLC";
      document.wMLCOrganismClaims.submit( );
   }
}

function smCancelAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smCancelAndReturnMLC";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditIngredientsSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditIngredientsSect";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditHumanHazardSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditHumanHazardSect";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditFirstAidSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditFirstAidSect";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditStorDispSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditStorDispSect";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditDirectionsUseSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditDirectionsUseSect";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditPrecautionarySection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditPrecautionarySection";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEnvironmentalHazards( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEnvironmentalHazards";
      document.wMLCOrganismClaims.submit( );
   }
}

function smGOTO_DilutionEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smGOTO_DilutionEntries";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditSurfacesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditSurfacesSection";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditLocationsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditLocationsSection";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditApplicationTypesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditApplicationTypesSection";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditClaimsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditClaimsSection";
      document.wMLCOrganismClaims.submit( );
   }
}

function smGOTO_ClaimsFootnote( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smGOTO_ClaimsFootnote";
      document.wMLCOrganismClaims.submit( );
   }
}

function smEditMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCOrganismClaims.zAction.value = "smEditMarketingSect";
      document.wMLCOrganismClaims.submit( );
   }
}

