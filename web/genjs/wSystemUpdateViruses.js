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
         document.wSystemUpdateViruses.zAction.value = "_OnResubmitPage";
         document.wSystemUpdateViruses.submit( );
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

      document.wSystemUpdateViruses.zAction.value = "_OnTimeout";
      document.wSystemUpdateViruses.submit( );
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
         document.wSystemUpdateViruses.zAction.value = "_OnUnload";
         document.wSystemUpdateViruses.submit( );
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

   var szFocusCtrl = document.wSystemUpdateViruses.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemUpdateViruses.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemUpdateViruses.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemUpdateViruses.zOpenFile.value;
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

   var keyRole = document.wSystemUpdateViruses.zKeyRole.value;
   document.wSystemUpdateViruses.zError.value = "";
   document.wSystemUpdateViruses.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemUpdateViruses.zTimeout.value;
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

function AcceptUpdateViruses( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "AcceptUpdateViruses";
      document.wSystemUpdateViruses.submit( );
   }
}

function AddNewVirus( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateViruses.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      if ( document.wSystemUpdateViruses.Virus.value == "" )
      {
         alert( "'Virus:' may not be blank to add a new Virus" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "AddNewVirus";
      document.wSystemUpdateViruses.submit( );
   }
}

function CancelUpdateViruses( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "CancelUpdateViruses";
      document.wSystemUpdateViruses.submit( );
   }
}

function DeleteVirus( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateViruses.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "DeleteVirus";
      document.wSystemUpdateViruses.submit( );
   }
}

function ImportVirusesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "ImportVirusesList";
      document.wSystemUpdateViruses.submit( );
   }
}

function InitVirusesForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   thisLi = document.getElementById( "lmSystem" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   var oRows = document.getElementById( "GridViruses" ).getElementsByTagName( 'tr' );
   if ( oRows.length > 1 ) // 1 for header
   {
      thisLi = document.getElementById( "PBNewVirus" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }

      // END of Javascript code entered by user.

   }
}

function NewVirusLast( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      if ( document.wSystemUpdateViruses.Virus.value == "" )
      {
         alert( "'Virus:' may not be blank to add a new Virus" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "NewVirusLast";
      document.wSystemUpdateViruses.submit( );
   }
}

function SelectVirus( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateViruses.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var tempField = document.getElementById( strTagEntityKey );
      document.wSystemUpdateViruses.Virus.value = tempField.innerText;
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "SelectVirus";
      document.wSystemUpdateViruses.submit( );
   }
}

function SortApplicationTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wSLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mEPA", "Viruses", "GridVirus",  ["Virus"]  ); // viewName, entityName, tableId, arrTableColumnTitles

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "SortApplicationTypes";
      document.wSystemUpdateViruses.submit( );
   }
}

function UpdateVirus( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateViruses.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var strVirus = document.wSystemUpdateViruses.Virus.value;
      if ( strVirus == null || strVirus == "" )
      {
         alert( "'Virus:' may not be blank to update a Virus" );
         return;
      }

      var tempField = document.getElementById( "GEVirus::" + strEntityKey );
      tempField.innerText = strVirus;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "UpdateVirus";
      document.wSystemUpdateViruses.submit( );
   }
}

function smImportVirusesList( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "smImportVirusesList";
      document.wSystemUpdateViruses.submit( );
   }
}

function smAcceptUpdateViruses( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "smAcceptUpdateViruses";
      document.wSystemUpdateViruses.submit( );
   }
}

function smCancelUpdateViruses( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "smCancelUpdateViruses";
      document.wSystemUpdateViruses.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "mTemplate";
      document.wSystemUpdateViruses.submit( );
   }
}

function mSystem( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "mSystem";
      document.wSystemUpdateViruses.submit( );
   }
}

function mShowFeedback( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "mShowFeedback";
      document.wSystemUpdateViruses.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateViruses.zAction.value = "_OnUnload";
      document.wSystemUpdateViruses.submit( );
   }
}

