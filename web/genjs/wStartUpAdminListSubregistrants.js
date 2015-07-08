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
         document.wStartUpAdminListSubregistrants.zAction.value = "_OnResubmitPage";
         document.wStartUpAdminListSubregistrants.submit( );
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

      document.wStartUpAdminListSubregistrants.zAction.value = "_OnTimeout";
      document.wStartUpAdminListSubregistrants.submit( );
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
         document.wStartUpAdminListSubregistrants.zAction.value = "_OnUnload";
         document.wStartUpAdminListSubregistrants.submit( );
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

   var szFocusCtrl = document.wStartUpAdminListSubregistrants.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wStartUpAdminListSubregistrants.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartUpAdminListSubregistrants.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartUpAdminListSubregistrants.zOpenFile.value;
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

   var keyRole = document.wStartUpAdminListSubregistrants.zKeyRole.value;
   document.wStartUpAdminListSubregistrants.zError.value = "";
   document.wStartUpAdminListSubregistrants.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wStartUpAdminListSubregistrants.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
   var thisLi;

   thisLi = document.getElementById( "lmStateRegistrations" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmLogout" );
    thisLi.style.visibility = "hidden";
    thisLi.style.display = "none"
   // Cannot go to subregistrant maintenance if already there.
   thisLi = document.getElementById( "lmSubregistrants" );
   thisLi.disabled = true;
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

function AddNewSubregistrant( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "AddNewSubregistrant";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function ClearSelected( )
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
               str = name.substr( 0, 3 );
               if ( str.match("ACS") )
               {
                  theForm.elements[ k ].checked = false;
               }
            }
         }
      }

      return;

      // END of Javascript code entered by user.

      document.wStartUpAdminListSubregistrants.zAction.value = "ClearSelected";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function EmailSelectedSubregistrants( )
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
      var rc = false;

      for ( j = 0; j < document.forms.length; j++ )
      {
         theForm = document.forms[ j ];
         for ( k = 0; k < theForm.length; k++ )
         {
            type = theForm.elements[ k ].type;
            if ( type == "checkbox" )
            {
               name = theForm.elements[ k ].name;
               str = name.substr( 0, 3 );
               if ( str.match("ACS") )
               {
                  if ( theForm.elements[ k ].checked == true )
                  {
                     rc = true;
                     break;
                  }
               }
            }
         }
      }

      if ( rc == false )
      {
         alert( "At least one Subregistrant must be selected." );
         return;
      }

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "EmailSelectedSubregistrants";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function InitListSubregistrants( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wStartUpAdminListSubregistrants.zAction.value = "InitListSubregistrants";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function Return( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "Return";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function SelectAll( )
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
               str = name.substr( 0, 3 );
               if ( str.match("ACS") )
               {
                  theForm.elements[ k ].checked = true;
               }
            }
         }
      }

      return;

      // END of Javascript code entered by user.

      document.wStartUpAdminListSubregistrants.zAction.value = "SelectAll";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function SelectListSubregistrantProducts( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wStartUpAdminListSubregistrants.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "SelectListSubregistrantProducts";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function SelectListSubregistrantsUsers( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wStartUpAdminListSubregistrants.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "SelectListSubregistrantsUsers";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function SelectSubregistrantForDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wStartUpAdminListSubregistrants.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "SelectSubregistrantForDelete";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function SelectSubregistrantForUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wStartUpAdminListSubregistrants.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "SelectSubregistrantForUpdate";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function smReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "smReturn";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mProductManagement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmProductManagement" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mProductManagement";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mSubregistrants( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmSubregistrants" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mSubregistrants";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mTrackingNotificationCompliance( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mTrackingNotificationCompliance";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mStateRegistrations( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmStateRegistrations" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mStateRegistrations";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mMarketingFulfillment( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmMarketingFulfillment" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mMarketingFulfillment";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mWebDevelopment( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmWebDevelopment" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mWebDevelopment";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mCompanyProfile( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmCompanyProfile" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mCompanyProfile";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mLogin( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmLogin" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "mLogin";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

function mLogout( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmLogout" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wStartUpAdminListSubregistrants.zAction.value = "_OnUnload";
      document.wStartUpAdminListSubregistrants.submit( );
   }
}

