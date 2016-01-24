var isWindowClosing = true;
var timerID = null;
onerror = handleErr;
window.history.forward( 1 );
var Tab1;

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
         document.wMLCAreasOfUse.zAction.value = "_OnResubmitPage";
         document.wMLCAreasOfUse.submit( );
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

      document.wMLCAreasOfUse.zAction.value = "_OnTimeout";
      document.wMLCAreasOfUse.submit( );
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
         document.wMLCAreasOfUse.zAction.value = "_OnUnload";
         document.wMLCAreasOfUse.submit( );
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

   var szFocusCtrl = document.wMLCAreasOfUse.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCAreasOfUse.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCAreasOfUse.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCAreasOfUse.zOpenFile.value;
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

   var LoginName = document.wMLCAreasOfUse.zLoginName.value;
   var keyRole = document.wMLCAreasOfUse.zKeyRole.value;
   document.wMLCAreasOfUse.zError.value = "";
   document.wMLCAreasOfUse.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCAreasOfUse.zTimeout.value;
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

function ADD_AreasUsageItems( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "ADD_AreasUsageItems";
      document.wMLCAreasOfUse.submit( );
   }
}

function GOTO_DeleteSelectedEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "GOTO_DeleteSelectedEntries";
      document.wMLCAreasOfUse.submit( );
   }
}

function DELETE_SelectedUsageEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

// Confirmation of  Delete.
if (!confirm("OK to delete selected Areas of Use?"))
{
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "DELETE_SelectedUsageEntries";
      document.wMLCAreasOfUse.submit( );
   }
}

function DELETE_UsageGroupEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "DELETE_UsageGroupEntries";
      document.wMLCAreasOfUse.submit( );
   }
}

function DELETE_UsageGroupEntriesOnly( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "DELETE_UsageGroupEntriesOnly";
      document.wMLCAreasOfUse.submit( );
   }
}

function GOTO_AddUsageGroup( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "GOTO_AddUsageGroup";
      document.wMLCAreasOfUse.submit( );
   }
}

function GOTO_UpdateAreasStatement( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCAreasOfUse.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "GOTO_UpdateAreasStatement";
      document.wMLCAreasOfUse.submit( );
   }
}

function GOTO_UpdateUsageGroup( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCAreasOfUse.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "GOTO_UpdateUsageGroup";
      document.wMLCAreasOfUse.submit( );
   }
}

function smSaveAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smSaveAndReturnMLC";
      document.wMLCAreasOfUse.submit( );
   }
}

function smSaveMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smSaveMLC";
      document.wMLCAreasOfUse.submit( );
   }
}

function smCancelAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smCancelAndReturnMLC";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditIngredientsSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditIngredientsSect";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditStorDispSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditStorDispSect";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditHumanHazardSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditHumanHazardSect";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditPrecautionarySection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditPrecautionarySection";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditFirstAidSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditFirstAidSect";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEnvironmentalHazards( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEnvironmentalHazards";
      document.wMLCAreasOfUse.submit( );
   }
}

function smGOTO_DilutionEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smGOTO_DilutionEntries";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditClaimsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditClaimsSection";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditSurfacesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditSurfacesSection";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditAreasOfUseSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditAreasOfUseSection";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditApplicationTypesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditApplicationTypesSection";
      document.wMLCAreasOfUse.submit( );
   }
}

function smGOTO_ClaimsFootnote( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smGOTO_ClaimsFootnote";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditDirectionsUseSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditDirectionsUseSect";
      document.wMLCAreasOfUse.submit( );
   }
}

function smEditMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAreasOfUse.zAction.value = "smEditMarketingSect";
      document.wMLCAreasOfUse.submit( );
   }
}

