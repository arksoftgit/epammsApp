// wMLCAddLocationsList   Generate Timestamp: 20160525203746325

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
         document.wMLCAddLocationsList.zAction.value = "_OnResubmitPage";
         document.wMLCAddLocationsList.submit( );
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

      document.wMLCAddLocationsList.zAction.value = "_OnTimeout";
      document.wMLCAddLocationsList.submit( );
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
         document.wMLCAddLocationsList.zAction.value = "_OnUnload";
         document.wMLCAddLocationsList.submit( );
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

   var szFocusCtrl = document.wMLCAddLocationsList.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCAddLocationsList.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCAddLocationsList.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCAddLocationsList.zOpenFile.value;
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

   var LoginName = document.wMLCAddLocationsList.zLoginName.value;
   var keyRole = document.wMLCAddLocationsList.zKeyRole.value;
   document.wMLCAddLocationsList.zError.value = "";
   document.wMLCAddLocationsList.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCAddLocationsList.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   var thisLi;

// if ( keyRole !== "Subregistrant" ) // If we are here, we have to be a Primary.
   thisLi = document.getElementById( "lmStateRegistrations" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   // Cannot go to product management if already there.
   thisLi = document.getElementById( "lmProductManagement" );
   thisLi.disabled = true;
   // END of Javascript code entered by user.

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

function CancelAddLocationsStmts( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAddLocationsList.zAction.value = "CancelAddLocationsStmts";
      document.wMLCAddLocationsList.submit( );
   }
}

function ClearSelectedLocations( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      var theForm;
      var type;
      var name;
      var str;
      var j;
      var k;

      for ( j = 0; j < document.forms.length; j++ )
      {
         theForm = document.forms[ j ];
         for ( k = 0; k < theForm.length; k++ )
         {
            type = theForm.elements[ k ].type;

            if ( type == "checkbox" )
            {
               name = theForm.elements[ k ].name;
               str = name.substr( 0, 9 );
               if ( str.match("GS_Select") )
               {
                  theForm.elements[ k ].checked = false;
               }
            }
         }
      }

      return;


      // END of Javascript code entered by user.

      document.wMLCAddLocationsList.zAction.value = "ClearSelectedLocations";
      document.wMLCAddLocationsList.submit( );
   }
}

function ConfirmAddLocationsStmtsReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAddLocationsList.zAction.value = "ConfirmAddLocationsStmtsReturn";
      document.wMLCAddLocationsList.submit( );
   }
}

function ConfirmAddSelectedLocations( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCAddLocationsList.zAction.value = "ConfirmAddSelectedLocations";
      document.wMLCAddLocationsList.submit( );
   }
}

function InitLocationsStmtsForInsert( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wMLCAddLocationsList.zAction.value = "InitLocationsStmtsForInsert";
      document.wMLCAddLocationsList.submit( );
   }
}

function SelectAllLocations( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      var theForm;
      var type;
      var name;
      var str;
      var j;
      var k;

      for ( j = 0; j < document.forms.length; j++ )
      {
         theForm = document.forms[ j ];
         for ( k = 0; k < theForm.length; k++ )
         {
            type = theForm.elements[ k ].type;

            if ( type == "checkbox" )
            {
               name = theForm.elements[ k ].name;
               str = name.substr( 0, 9 );
               if ( str.match("GS_Select") )
               {
                  theForm.elements[ k ].checked = true;
               }
            }
         }
      }

      return;


      // END of Javascript code entered by user.

      document.wMLCAddLocationsList.zAction.value = "SelectAllLocations";
      document.wMLCAddLocationsList.submit( );
   }
}

