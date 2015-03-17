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
         document.wSystemUpdateBacteria.zAction.value = "_OnResubmitPage";
         document.wSystemUpdateBacteria.submit( );
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

      document.wSystemUpdateBacteria.zAction.value = "_OnTimeout";
      document.wSystemUpdateBacteria.submit( );
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
         document.wSystemUpdateBacteria.zAction.value = "_OnUnload";
         document.wSystemUpdateBacteria.submit( );
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

   var szFocusCtrl = document.wSystemUpdateBacteria.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemUpdateBacteria.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemUpdateBacteria.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemUpdateBacteria.zOpenFile.value;
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

   var keyRole = document.wSystemUpdateBacteria.zKeyRole.value;
   document.wSystemUpdateBacteria.zError.value = "";
   document.wSystemUpdateBacteria.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemUpdateBacteria.zTimeout.value;
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

function AcceptUpdateBacteria( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "AcceptUpdateBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function AddNewBacteria( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateBacteria.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      if ( document.wSystemUpdateBacteria.Bacteria.value == "" )
      {
         alert( "'Bacteria:' may not be blank to add a new Bacteria" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "AddNewBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function CancelUpdateBacteria( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "CancelUpdateBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function ClearSelectedBacteria( )
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

   }
}

function DeleteBacteria( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateBacteria.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "DeleteBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function DeleteSelectedBacteria( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "DeleteSelectedBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function ImportBacteriaList( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "ImportBacteriaList";
      document.wSystemUpdateBacteria.submit( );
   }
}

function InitBacteriaForUpdate( )
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

   var oRows = document.getElementById( "GridBacteria" ).getElementsByTagName( 'tr' );
   if ( oRows.length > 1 ) // 1 for header
   {
      thisLi = document.getElementById( "PBNewBacteria" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }

      // END of Javascript code entered by user.

   }
}

function NewBacteriaLast( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      if ( document.wSystemUpdateBacteria.Bacteria.value == "" )
      {
         alert( "'Bacteria:' may not be blank to add a new Bacteria" );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "NewBacteriaLast";
      document.wSystemUpdateBacteria.submit( );
   }
}

function SelectAllBacteria( )
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

   }
}

function SelectBacteria( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateBacteria.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var tempField = document.getElementById( strTagEntityKey );
      document.wSystemUpdateBacteria.Bacteria.value = tempField.innerText;
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "SelectBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function SortApplicationTypes( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

       document.wSLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mEPA", "EPA_Bacteria", "GridBacteria",  ["Bacteria"]  ); // viewName, entityName, tableId, arrTableColumnTitles

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "SortApplicationTypes";
      document.wSystemUpdateBacteria.submit( );
   }
}

function UpdateBacteria( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSystemUpdateBacteria.zTableRowSelect.value = strEntityKey;
      // Javascript code entered by user.

      var strBacteria = document.wSystemUpdateBacteria.Bacteria.value;
      if ( strBacteria == null || strBacteria == "" )
      {
         alert( "'Bacteria:' may not be blank to update a Bacteria" );
         return;
      }

      var tempField = document.getElementById( "GEBacteria::" + strEntityKey );
      tempField.innerText = strBacteria;


      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "UpdateBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function smImportBacteriaList( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "smImportBacteriaList";
      document.wSystemUpdateBacteria.submit( );
   }
}

function smAcceptUpdateBacteria( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "smAcceptUpdateBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function smCancelUpdateBacteria( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "smCancelUpdateBacteria";
      document.wSystemUpdateBacteria.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "mTemplate";
      document.wSystemUpdateBacteria.submit( );
   }
}

function mSystem( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "mSystem";
      document.wSystemUpdateBacteria.submit( );
   }
}

function mShowFeedback( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "mShowFeedback";
      document.wSystemUpdateBacteria.submit( );
   }
}

function mLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemUpdateBacteria.zAction.value = "_OnUnload";
      document.wSystemUpdateBacteria.submit( );
   }
}

