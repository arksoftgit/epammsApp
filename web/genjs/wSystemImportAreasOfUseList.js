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
         document.wSystemImportAreasOfUseList.zAction.value = "_OnResubmitPage";
         document.wSystemImportAreasOfUseList.submit( );
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

      document.wSystemImportAreasOfUseList.zAction.value = "_OnTimeout";
      document.wSystemImportAreasOfUseList.submit( );
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
         document.wSystemImportAreasOfUseList.zAction.value = "_OnUnload";
         document.wSystemImportAreasOfUseList.submit( );
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

   var szFocusCtrl = document.wSystemImportAreasOfUseList.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemImportAreasOfUseList.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemImportAreasOfUseList.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemImportAreasOfUseList.zOpenFile.value;
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

   var keyRole = document.wSystemImportAreasOfUseList.zKeyRole.value;
   document.wSystemImportAreasOfUseList.zError.value = "";
   document.wSystemImportAreasOfUseList.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemImportAreasOfUseList.zTimeout.value;
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

function CancelImportAreasOfUseAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "CancelImportAreasOfUseAndReturn";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function SortWorkList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var str = document.wSystemImportAreasOfUseList.Work.value;
   var splitArray = str.split( '\n' );
// alert( "SplitArray: " + splitArray );
   splitArray.sort( );
// alert( "SplitArray: " + splitArray );
   document.wSystemImportAreasOfUseList.Work.value = splitArray.join( '\n' );
   return;

      // END of Javascript code entered by user.

   }
}

function ConfirmImportAreasOfUseAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "ConfirmImportAreasOfUseAndReturn";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function ImportAreasOfUseFromFile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "ImportAreasOfUseFromFile";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function InitImportAreasOfUseList( )
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

      // END of Javascript code entered by user.

   }
}

function SortAreasOfUseList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var str = document.wSystemImportAreasOfUseList.Import.value;
   var splitArray = str.split( '\n' );
// alert( "SplitArray: " + splitArray );
   splitArray.sort( );
// alert( "SplitArray: " + splitArray );
   document.wSystemImportAreasOfUseList.Import.value = splitArray.join( '\n' );
   return;

      // END of Javascript code entered by user.

   }
}

function smConfirmImportAreasOfUseAndReturn( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "smConfirmImportAreasOfUseAndReturn";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function smImportAreasOfUseFromFile( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "smImportAreasOfUseFromFile";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function smCancelImportAreasOfUseAndReturn( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "smCancelImportAreasOfUseAndReturn";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "mTemplate";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function mSystem( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "mSystem";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function mShowFeedback( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "mShowFeedback";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemImportAreasOfUseList.zAction.value = "_OnUnload";
      document.wSystemImportAreasOfUseList.submit( );
   }
}

