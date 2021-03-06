// wMLCApplicationTypes   Generate Timestamp: 20170721173629881

var isWindowClosing = true;
var timerID = null;
onerror = handleErr;
window.history.forward( 1 );
var Tab;

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
         document.wMLCApplicationTypes.zAction.value = "_OnResubmitPage";
         document.wMLCApplicationTypes.submit( );
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

      document.wMLCApplicationTypes.zAction.value = "_OnTimeout";
      document.wMLCApplicationTypes.submit( );
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
         document.wMLCApplicationTypes.zAction.value = "_OnUnload";
         document.wMLCApplicationTypes.submit( );
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

   var szFocusCtrl = document.wMLCApplicationTypes.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCApplicationTypes.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCApplicationTypes.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCApplicationTypes.zOpenFile.value;
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

   var LoginName = document.wMLCApplicationTypes.zLoginName.value;
   var keyRole = document.wMLCApplicationTypes.zKeyRole.value;
   document.wMLCApplicationTypes.zError.value = "";
   document.wMLCApplicationTypes.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCApplicationTypes.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

var $wai = $("#wai"); if ( $wai ) { $wai.text( document.title ); }
   var storageName = "epamms.wMLCApplicationTypes.position";
   var scrollPosition = sessionStorage.getItem( storageName );
   if ( scrollPosition.indexOf('#') > 0 )
   {
      var parts = scrollPosition.split( '#' );
      document.body.scrollTop = parseInt( parts[parts.length - 2] );
      document.body.scrollLeft = parseInt( parts[parts.length - 1] );
   }
   sessionStorage.removeItem( storageName );
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

function ADD_ApplicationTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "ADD_ApplicationTypes";
      document.wMLCApplicationTypes.submit( );
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
if (!confirm("OK to delete selected Application Types?"))
{
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "DELETE_SelectedUsageEntries";
      document.wMLCApplicationTypes.submit( );
   }
}

function DELETE_ApplicationType( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCApplicationTypes.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

// Confirmation of  Delete.
if (!confirm("Delete Application Type?"))
{
   return;
}

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "DELETE_ApplicationType";
      document.wMLCApplicationTypes.submit( );
   }
}

function DELETE_UsageGroupEntriesOnly( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "DELETE_UsageGroupEntriesOnly";
      document.wMLCApplicationTypes.submit( );
   }
}

function DeleteUsageGroup( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCApplicationTypes.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "DeleteUsageGroup";
      document.wMLCApplicationTypes.submit( );
   }
}

function GOTO_AddUsageGroup( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "GOTO_AddUsageGroup";
      document.wMLCApplicationTypes.submit( );
   }
}

function GOTO_DeleteSelectedApplTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "GOTO_DeleteSelectedApplTypes";
      document.wMLCApplicationTypes.submit( );
   }
}

function GOTO_UpdateStandaloneApplTypes( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCApplicationTypes.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "GOTO_UpdateStandaloneApplTypes";
      document.wMLCApplicationTypes.submit( );
   }
}

function GOTO_UpdateApplicationTypesStmt( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCApplicationTypes.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "GOTO_UpdateApplicationTypesStmt";
      document.wMLCApplicationTypes.submit( );
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

      document.wMLCApplicationTypes.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "GOTO_UpdateUsageGroup";
      document.wMLCApplicationTypes.submit( );
   }
}

function GOTO_UpdateGroup( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCApplicationTypes.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "GOTO_UpdateGroup";
      document.wMLCApplicationTypes.submit( );
   }
}

function SortGroups( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wMLCApplicationTypes.zTableRowSelect.value = buildSortTableHtml( "mMasLC", "M_UsageGroup", "GridApplicationTypesGroup",  ["Name", "Combined Application Type"]  );

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "SortGroups";
      document.wMLCApplicationTypes.submit( );
   }
}

function SortSurfaces( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wMLCApplicationTypes.zTableRowSelect.value = buildSortTableHtml( "mMasLC", "M_Usage", "GridApplicationTypes",  ["Application Type"]  );

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      if ( typeof(Storage) !== "undefined" )
      {
         // Code for localStorage/sessionStorage.
         var storageName = "epamms.wMLCApplicationTypes.position"
         var scrollPosition = document.body.scrollTop + '#' + document.body.scrollLeft;
         sessionStorage.setItem( storageName, scrollPosition );
      }
      document.wMLCApplicationTypes.zAction.value = "SortSurfaces";
      document.wMLCApplicationTypes.submit( );
   }
}

function smSaveMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smSaveMLC";
      document.wMLCApplicationTypes.submit( );
   }
}

function smSaveAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smSaveAndReturnMLC";
      document.wMLCApplicationTypes.submit( );
   }
}

function smCancelAndReturnMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smCancelAndReturnMLC";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditIngredientsSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditIngredientsSect";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditHumanHazardSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditHumanHazardSect";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditFirstAidSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditFirstAidSect";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditStorDispSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditStorDispSect";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditDirectionsUseSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditDirectionsUseSect";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditPrecautionarySection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditPrecautionarySection";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEnvironmentalHazards( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEnvironmentalHazards";
      document.wMLCApplicationTypes.submit( );
   }
}

function smGOTO_DilutionEntries( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smGOTO_DilutionEntries";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditSurfacesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditSurfacesSection";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditLocationsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditLocationsSection";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditApplicationTypesSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditApplicationTypesSection";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditClaimsSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditClaimsSection";
      document.wMLCApplicationTypes.submit( );
   }
}

function smGOTO_ClaimsFootnote( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smGOTO_ClaimsFootnote";
      document.wMLCApplicationTypes.submit( );
   }
}

function smEditMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smEditMarketingSect";
      document.wMLCApplicationTypes.submit( );
   }
}

function smTables( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCApplicationTypes.zAction.value = "smTables";
      document.wMLCApplicationTypes.submit( );
   }
}

