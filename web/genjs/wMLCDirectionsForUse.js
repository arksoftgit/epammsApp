// wMLCDirectionsForUse   Generate Timestamp: 20160525203749075

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
         document.wMLCDirectionsForUse.zAction.value = "_OnResubmitPage";
         document.wMLCDirectionsForUse.submit( );
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

      document.wMLCDirectionsForUse.zAction.value = "_OnTimeout";
      document.wMLCDirectionsForUse.submit( );
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
         document.wMLCDirectionsForUse.zAction.value = "_OnUnload";
         document.wMLCDirectionsForUse.submit( );
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

   var szFocusCtrl = document.wMLCDirectionsForUse.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCDirectionsForUse.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCDirectionsForUse.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCDirectionsForUse.zOpenFile.value;
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

   var LoginName = document.wMLCDirectionsForUse.zLoginName.value;
   var keyRole = document.wMLCDirectionsForUse.zKeyRole.value;
   document.wMLCDirectionsForUse.zError.value = "";
   document.wMLCDirectionsForUse.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCDirectionsForUse.zTimeout.value;
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

function GOTO_DirsForUseSectionDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCDirectionsForUse.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "GOTO_DirsForUseSectionDelete";
      document.wMLCDirectionsForUse.submit( );
   }
}

function Sort( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wMLCDirectionsForUse.zTableRowSelect.value = buildSortTableHtml( "mMasLC", "M_DirectionsForUseSection", "GridDirectionsForUse",  ["Name","Title"]  );

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "Sort";
      document.wMLCDirectionsForUse.submit( );
   }
}

function GOTO_DirsForUseSectionUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCDirectionsForUse.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "GOTO_DirsForUseSectionUpdate";
      document.wMLCDirectionsForUse.submit( );
   }
}

function GOTO_DU_SectionAddAfter( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "GOTO_DU_SectionAddAfter";
      document.wMLCDirectionsForUse.submit( );
   }
}

function GOTO_DU_SectionAdd( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "GOTO_DU_SectionAdd";
      document.wMLCDirectionsForUse.submit( );
   }
}

function GOTO_DU_SectionAddBefore( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "GOTO_DU_SectionAddBefore";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smSaveAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smSaveAndReturnMLC";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smSaveMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smSaveMLC";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smCancelAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smCancelAndReturnMLC";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditIngredientsSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditIngredientsSect";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditHumanHazardSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditHumanHazardSect";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditFirstAidSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditFirstAidSect";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditStorDispSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditStorDispSect";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditDirectionsUseSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditDirectionsUseSect";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditPrecautionarySection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditPrecautionarySection";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEnvironmentalHazards( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEnvironmentalHazards";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smGOTO_DilutionEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smGOTO_DilutionEntries";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditSurfacesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditSurfacesSection";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditLocationsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditLocationsSection";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditApplicationTypesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditApplicationTypesSection";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditClaimsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditClaimsSection";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smGOTO_ClaimsFootnote( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smGOTO_ClaimsFootnote";
      document.wMLCDirectionsForUse.submit( );
   }
}

function smEditMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCDirectionsForUse.zAction.value = "smEditMarketingSect";
      document.wMLCDirectionsForUse.submit( );
   }
}

