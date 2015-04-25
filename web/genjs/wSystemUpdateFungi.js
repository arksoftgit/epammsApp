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
         document.wSystemUpdateFungi.zAction.value = "_OnResubmitPage";
         document.wSystemUpdateFungi.submit( );
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

      document.wSystemUpdateFungi.zAction.value = "_OnTimeout";
      document.wSystemUpdateFungi.submit( );
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
         document.wSystemUpdateFungi.zAction.value = "_OnUnload";
         document.wSystemUpdateFungi.submit( );
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

   var szFocusCtrl = document.wSystemUpdateFungi.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemUpdateFungi.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemUpdateFungi.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemUpdateFungi.zOpenFile.value;
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

   var keyRole = document.wSystemUpdateFungi.zKeyRole.value;
   document.wSystemUpdateFungi.zError.value = "";
   document.wSystemUpdateFungi.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemUpdateFungi.zTimeout.value;
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

function AcceptUpdateFungi( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "AcceptUpdateFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function SortApplicationTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wSLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mEPA", "EPA_Claim", "GridFungi",  ["Fungi"]  ); // viewName, entityName, tableId, arrTableColumnTitles

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "SortApplicationTypes";
      document.wSystemUpdateFungi.submit( );
   }
}

function NewFungiLast( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      if ( document.wSystemUpdateFungi.Fungi.value == "" )
      {
         alert( "'Fungus:' may not be blank to add a new Fungus" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "NewFungiLast";
      document.wSystemUpdateFungi.submit( );
   }
}

function CancelUpdateFungi( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "CancelUpdateFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function DeleteFungi( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateFungi.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "DeleteFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function ImportFungiList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "ImportFungiList";
      document.wSystemUpdateFungi.submit( );
   }
}

function InitFungiForUpdate( )
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

   var oRows = document.getElementById( "GridFungi" ).getElementsByTagName( 'tr' );
   if ( oRows.length > 1 ) // 1 for header
   {
      thisLi = document.getElementById( "PBNewFungi" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }

      // END of Javascript code entered by user.

   }
}

function UpdateFungi( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateFungi.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var strFungi = document.wSystemUpdateFungi.Fungi.value;
      if ( strFungi == null || strFungi == "" )
      {
         alert( "'Fungus:' may not be blank to update a Fungus" );
         return;
      }

      var tempField = document.getElementById( "GEFungi::" + strEntityKey );
      tempField.innerText = strFungi;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "UpdateFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function AddNewFungi( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateFungi.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      if ( document.wSystemUpdateFungi.Fungi.value == "" )
      {
         alert( "'Fungus:' may not be blank to add a new Fungus" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "AddNewFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function SelectFungi( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateFungi.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var tempField = document.getElementById( strTagEntityKey );
      document.wSystemUpdateFungi.Fungi.value = tempField.innerText;
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "SelectFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function smImportFungiList( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "smImportFungiList";
      document.wSystemUpdateFungi.submit( );
   }
}

function smAcceptUpdateFungi( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "smAcceptUpdateFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function smCancelUpdateFungi( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "smCancelUpdateFungi";
      document.wSystemUpdateFungi.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "mTemplate";
      document.wSystemUpdateFungi.submit( );
   }
}

function mSystem( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "mSystem";
      document.wSystemUpdateFungi.submit( );
   }
}

function mShowFeedback( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "mShowFeedback";
      document.wSystemUpdateFungi.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateFungi.zAction.value = "_OnUnload";
      document.wSystemUpdateFungi.submit( );
   }
}

