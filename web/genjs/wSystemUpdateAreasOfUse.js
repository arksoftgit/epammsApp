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
         document.wSystemUpdateAreasOfUse.zAction.value = "_OnResubmitPage";
         document.wSystemUpdateAreasOfUse.submit( );
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

      document.wSystemUpdateAreasOfUse.zAction.value = "_OnTimeout";
      document.wSystemUpdateAreasOfUse.submit( );
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
         document.wSystemUpdateAreasOfUse.zAction.value = "_OnUnload";
         document.wSystemUpdateAreasOfUse.submit( );
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

   var szFocusCtrl = document.wSystemUpdateAreasOfUse.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemUpdateAreasOfUse.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemUpdateAreasOfUse.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemUpdateAreasOfUse.zOpenFile.value;
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

   var keyRole = document.wSystemUpdateAreasOfUse.zKeyRole.value;
   document.wSystemUpdateAreasOfUse.zError.value = "";
   document.wSystemUpdateAreasOfUse.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemUpdateAreasOfUse.zTimeout.value;
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

function AcceptUpdateAreasOfUse( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "AcceptUpdateAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function AddNewAreasOfUse( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAreasOfUse.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      if ( document.wSystemUpdateAreasOfUse.AreasOfUse.value == "" )
      {
         alert( "'Area of Use:' may not be blank to add a new Area of Use" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "AddNewAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function CancelUpdateAreasOfUse( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "CancelUpdateAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function DeleteAreasOfUse( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAreasOfUse.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "DeleteAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function ImportAreasOfUseList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "ImportAreasOfUseList";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function InitAreasOfUseForUpdate( )
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

   var oRows = document.getElementById( "GridAreasOfUse" ).getElementsByTagName( 'tr' );
   if ( oRows.length > 1 ) // 1 for header
   {
      thisLi = document.getElementById( "PBNewAreasOfUse" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }

      // END of Javascript code entered by user.

   }
}

function NewAreasOfUseLast( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      if ( document.wSystemUpdateAreasOfUse.AreasOfUse.value == "" )
      {
         alert( "'Area of Use:' may not be blank to add a new Area of Use" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "NewAreasOfUseLast";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function SelectAreasOfUse( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAreasOfUse.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var tempField = document.getElementById( strTagEntityKey );
      document.wSystemUpdateAreasOfUse.AreasOfUse.value = tempField.innerText;
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "SelectAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function SortApplicationTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wSLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mEPA", "EPA_AreaOfUse", "GridAreasUse",  ["Area of Use"]  ); // viewName, entityName, tableId, arrTableColumnTitles

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "SortApplicationTypes";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function UpdateAreasOfUse( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAreasOfUse.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var strAreaUse = document.wSystemUpdateAreasOfUse.AreasOfUse.value;
      if ( strAreaUse == null || strAreaUse == "" )
      {
         alert( "'Area of Use:' may not be blank to update an Area of Use" );
         return;
      }

      var tempField = document.getElementById( "GEAreasOfUse::" + strEntityKey );
      tempField.innerText = strAreaUse;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "UpdateAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function smImportAreasOfUseList( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "smImportAreasOfUseList";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function smAcceptUpdateAreasOfUse( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "smAcceptUpdateAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function smCancelUpdateAreasOfUse( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "smCancelUpdateAreasOfUse";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "mTemplate";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function mSystem( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "mSystem";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function mShowFeedback( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "mShowFeedback";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAreasOfUse.zAction.value = "_OnUnload";
      document.wSystemUpdateAreasOfUse.submit( );
   }
}

