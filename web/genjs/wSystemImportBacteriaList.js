// wSystemImportBacteriaList   Generate Timestamp: 20160531205257225

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
         document.wSystemImportBacteriaList.zAction.value = "_OnResubmitPage";
         document.wSystemImportBacteriaList.submit( );
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

      document.wSystemImportBacteriaList.zAction.value = "_OnTimeout";
      document.wSystemImportBacteriaList.submit( );
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
         document.wSystemImportBacteriaList.zAction.value = "_OnUnload";
         document.wSystemImportBacteriaList.submit( );
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

   var szFocusCtrl = document.wSystemImportBacteriaList.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemImportBacteriaList.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemImportBacteriaList.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemImportBacteriaList.zOpenFile.value;
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

   var LoginName = document.wSystemImportBacteriaList.zLoginName.value;
   var keyRole = document.wSystemImportBacteriaList.zKeyRole.value;
   document.wSystemImportBacteriaList.zError.value = "";
   document.wSystemImportBacteriaList.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemImportBacteriaList.zTimeout.value;
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

function CancelImportBacteriaAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "CancelImportBacteriaAndReturn";
      document.wSystemImportBacteriaList.submit( );
   }
}

function ConfirmImportBacteriaAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "ConfirmImportBacteriaAndReturn";
      document.wSystemImportBacteriaList.submit( );
   }
}

function ImportBacteriaFromFile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "ImportBacteriaFromFile";
      document.wSystemImportBacteriaList.submit( );
   }
}

function InitImportBacteriaList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "InitImportBacteriaList";
      document.wSystemImportBacteriaList.submit( );
   }
}

function SortImportList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var str = document.wSystemImportBacteriaList.Import.value;
   var splitArray = str.split( '\n' );
// alert( "SplitArray: " + splitArray );
   splitArray.sort( );
// alert( "SplitArray: " + splitArray );
   document.wSystemImportBacteriaList.Import.value = splitArray.join( '\n' );
   return;

      // END of Javascript code entered by user.

      document.wSystemImportBacteriaList.zAction.value = "SortImportList";
      document.wSystemImportBacteriaList.submit( );
   }
}

function SortWorkList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var str = document.wSystemImportBacteriaList.Work.value;
   var splitArray = str.split( '\n' );
// alert( "SplitArray: " + splitArray );
   splitArray.sort( );
// alert( "SplitArray: " + splitArray );
   document.wSystemImportBacteriaList.Work.value = splitArray.join( '\n' );
   return;

      // END of Javascript code entered by user.

      document.wSystemImportBacteriaList.zAction.value = "SortWorkList";
      document.wSystemImportBacteriaList.submit( );
   }
}

function smConfirmImportBacteriaAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "smConfirmImportBacteriaAndReturn";
      document.wSystemImportBacteriaList.submit( );
   }
}

function smImportBacteriaFromFile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "smImportBacteriaFromFile";
      document.wSystemImportBacteriaList.submit( );
   }
}

function smCancelImportBacteriaAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportBacteriaList.zAction.value = "smCancelImportBacteriaAndReturn";
      document.wSystemImportBacteriaList.submit( );
   }
}

