// wPrimRUpdateMasterProduct   Generate Timestamp: 20160531205238616

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
         document.wPrimRUpdateMasterProduct.zAction.value = "_OnResubmitPage";
         document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "_OnTimeout";
      document.wPrimRUpdateMasterProduct.submit( );
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
         document.wPrimRUpdateMasterProduct.zAction.value = "_OnUnload";
         document.wPrimRUpdateMasterProduct.submit( );
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

   var szFocusCtrl = document.wPrimRUpdateMasterProduct.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wPrimRUpdateMasterProduct.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wPrimRUpdateMasterProduct.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wPrimRUpdateMasterProduct.zOpenFile.value;
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

   var LoginName = document.wPrimRUpdateMasterProduct.zLoginName.value;
   var keyRole = document.wPrimRUpdateMasterProduct.zKeyRole.value;
   document.wPrimRUpdateMasterProduct.zError.value = "";
   document.wPrimRUpdateMasterProduct.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wPrimRUpdateMasterProduct.hEPA_ToxicityCategory.value = document.wPrimRUpdateMasterProduct.EPA_ToxicityCategory.value

   var varTimeout = document.wPrimRUpdateMasterProduct.zTimeout.value;
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

function AcceptUpdateMasterProduct( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "AcceptUpdateMasterProduct";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function CancelNewMasterProduct( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "CancelNewMasterProduct";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function CancelUpdateMasterProduct( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "CancelUpdateMasterProduct";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function DeleteMasterProductContent( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wPrimRUpdateMasterProduct.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "DeleteMasterProductContent";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function InitMasterProductForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "InitMasterProductForUpdate";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function MoveMasterProductContentDown( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "MoveMasterProductContentDown";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function MoveMasterProductContentUp( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "MoveMasterProductContentUp";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function NewMasterProductContent( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "NewMasterProductContent";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function UpdateMasterProductContent( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wPrimRUpdateMasterProduct.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "UpdateMasterProductContent";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function smSystem( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "smSystem";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function smShowFeedback( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "smShowFeedback";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function smLogin( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "smLogin";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mProductManagement";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mSubregistrants";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mTrackingNotificationCompliance";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mStateRegistrations";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mMarketingFulfillment";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mWebDevelopment";
      document.wPrimRUpdateMasterProduct.submit( );
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

      document.wPrimRUpdateMasterProduct.zAction.value = "mCompanyProfile";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function mUsers( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wPrimRUpdateMasterProduct.zAction.value = "mUsers";
      document.wPrimRUpdateMasterProduct.submit( );
   }
}

function EPA_ToxicityCategoryOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wPrimRUpdateMasterProduct.hEPA_ToxicityCategory.value = document.wPrimRUpdateMasterProduct.EPA_ToxicityCategory.value;
   }
}

