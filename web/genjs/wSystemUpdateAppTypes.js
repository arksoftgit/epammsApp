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
         document.wSystemUpdateAppTypes.zAction.value = "_OnResubmitPage";
         document.wSystemUpdateAppTypes.submit( );
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

      document.wSystemUpdateAppTypes.zAction.value = "_OnTimeout";
      document.wSystemUpdateAppTypes.submit( );
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
         document.wSystemUpdateAppTypes.zAction.value = "_OnUnload";
         document.wSystemUpdateAppTypes.submit( );
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

   var szFocusCtrl = document.wSystemUpdateAppTypes.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemUpdateAppTypes.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemUpdateAppTypes.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemUpdateAppTypes.zOpenFile.value;
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

   var LoginName = document.wSystemUpdateAppTypes.zLoginName.value;
   var keyRole = document.wSystemUpdateAppTypes.zKeyRole.value;
   document.wSystemUpdateAppTypes.zError.value = "";
   document.wSystemUpdateAppTypes.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemUpdateAppTypes.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   var oRows = document.getElementById( "GridAppTypes" ).getElementsByTagName( 'tr' );
   if ( oRows.length > 1 ) // 1 for header
   {
      var thisLi = document.getElementById( "PBNewAppType" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }
   // END of Javascript code entered by user.

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

function AcceptUpdateAppTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "AcceptUpdateAppTypes";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function AddNewAppType( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAppTypes.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      if ( document.wSystemUpdateAppTypes.AppType.value == "" )
      {
         alert( "'Application Type:' may not be blank to add a new Application Type" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "AddNewAppType";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function CancelUpdateAppTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "CancelUpdateAppTypes";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function DeleteAppType( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAppTypes.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "DeleteAppType";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function ImportAppTypesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "ImportAppTypesList";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function InitAppTypesForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSystemUpdateAppTypes.zAction.value = "InitAppTypesForUpdate";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function NewAppTypeLast( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      if ( document.wSystemUpdateAppTypes.AppType.value == "" )
      {
         alert( "'Application Type:' may not be blank to add a new Application Type" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "NewAppTypeLast";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function SelectAppType( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAppTypes.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var tempField = document.getElementById( strTagEntityKey );
      document.wSystemUpdateAppTypes.AppType.value = tempField.innerText;
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "SelectAppType";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function SortApplicationTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wSLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mEPA", "EPA_ApplicationType", "GridAppTypes",  ["Application Type"]  ); // viewName, entityName, tableId, arrTableColumnTitles

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "SortApplicationTypes";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function UpdateAppType( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateAppTypes.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var strAppType = document.wSystemUpdateAppTypes.AppType.value;
      if ( strAppType == null || strAppType == "" )
      {
         alert( "'Application Type:' may not be blank to update an Application Type" );
         return;
      }

      var tempField = document.getElementById( "GEAppType::" + strEntityKey );
      tempField.innerText = strAppType;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "UpdateAppType";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function smImportAppTypesList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "smImportAppTypesList";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function smAcceptUpdateAppTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "smAcceptUpdateAppTypes";
      document.wSystemUpdateAppTypes.submit( );
   }
}

function smCancelUpdateAppTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateAppTypes.zAction.value = "smCancelUpdateAppTypes";
      document.wSystemUpdateAppTypes.submit( );
   }
}

