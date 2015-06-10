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
         document.wMLCPhysicalChemicalHazardsSection.zAction.value = "_OnResubmitPage";
         document.wMLCPhysicalChemicalHazardsSection.submit( );
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

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "_OnTimeout";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
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
         document.wMLCPhysicalChemicalHazardsSection.zAction.value = "_OnUnload";
         document.wMLCPhysicalChemicalHazardsSection.submit( );
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

   var szFocusCtrl = document.wMLCPhysicalChemicalHazardsSection.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCPhysicalChemicalHazardsSection.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCPhysicalChemicalHazardsSection.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCPhysicalChemicalHazardsSection.zOpenFile.value;
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

   var keyRole = document.wMLCPhysicalChemicalHazardsSection.zKeyRole.value;
   document.wMLCPhysicalChemicalHazardsSection.zError.value = "";
   document.wMLCPhysicalChemicalHazardsSection.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCPhysicalChemicalHazardsSection.zTimeout.value;
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

function GOTO_ChemicalHazardsDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCPhysicalChemicalHazardsSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "GOTO_ChemicalHazardsDelete";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function GOTO_ChemicalHazardsUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCPhysicalChemicalHazardsSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "GOTO_ChemicalHazardsUpdate";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function GOTO_ChemicalHazardsAdd( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "GOTO_ChemicalHazardsAdd";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smSaveAndReturnMLC( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smSaveAndReturnMLC";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smSaveMLC( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smSaveMLC";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smCancelAndReturnMLC( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smCancelAndReturnMLC";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditIngredientsSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditIngredientsSect";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditStorDispSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditStorDispSect";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditHumanHazardSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditHumanHazardSect";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditPrecautionarySection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditPrecautionarySection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditFirstAidSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditFirstAidSect";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditEnvironmentalHazardSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditEnvironmentalHazardSection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditChemicalHazardsSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditChemicalHazardsSection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smGOTO_DilutionEntries( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smGOTO_DilutionEntries";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditClaimsSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditClaimsSection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditSurfacesSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditSurfacesSection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditAreasOfUseSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditAreasOfUseSection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditApplicationTypesSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditApplicationTypesSection";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smGOTO_ClaimsFootnote( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smGOTO_ClaimsFootnote";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditDirectionsUseSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditDirectionsUseSect";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

function smEditMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCPhysicalChemicalHazardsSection.zAction.value = "smEditMarketingSect";
      document.wMLCPhysicalChemicalHazardsSection.submit( );
   }
}

