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
         document.wMLCMarketing.zAction.value = "_OnResubmitPage";
         document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "_OnTimeout";
      document.wMLCMarketing.submit( );
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
         document.wMLCMarketing.zAction.value = "_OnUnload";
         document.wMLCMarketing.submit( );
      }
   }
}

function _IsDocDisabled( )
{
   var theForm;
   var j;
   var k;

   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         if ( theForm.elements[ k ].name == "zDisable" )
            return theForm.elements[ k ].disabled;
      }
   }

   return false;
}

function _DisableFormElements( bDisabled )
{
   var theForm;
   var type;
   var lis;
   var thisLi;
   var j;
   var k;
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

   // We want to set some fields as disabled (like buttons and comboboxes) so that
   // while the jsp code is processing, users can not select these controls.
   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         type = theForm.elements[ k ].type;

         if ( type == "button" || type == "submit" || (type != null && type.indexOf( "select" ) == 0) )
         {
            theForm.elements[ k ].disabled = bDisabled;
         }
         else
         if ( theForm.elements[ k ].name == "zDisable" )
         {
            theForm.elements[ k ].disabled = bDisabled;
            bRC = true;
         }
      }
   }

   lis = document.getElementsByTagName( "li" );
   for ( k = 0; k < lis.length; k++ )
   {
      thisLi = lis[ k ];
      thisLi.disabled = bDisabled;
   }

   return bRC;
}

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wMLCMarketing.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCMarketing.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCMarketing.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCMarketing.zOpenFile.value;
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

   document.wMLCMarketing.zError.value = "";
   document.wMLCMarketing.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCMarketing.zTimeout.value;
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

function AddNewMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "AddNewMarketingSect";
      document.wMLCMarketing.submit( );
   }
}

function CancelMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "CancelMarketingSect";
      document.wMLCMarketing.submit( );
   }
}

function MoveMarketingSectDown( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketing.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "MoveMarketingSectDown";
      document.wMLCMarketing.submit( );
   }
}

function MoveMarketingSectUp( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketing.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "MoveMarketingSectUp";
      document.wMLCMarketing.submit( );
   }
}

function SaveMasterLabelContent( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "SaveMasterLabelContent";
      document.wMLCMarketing.submit( );
   }
}

function SelectMarketingSectForDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketing.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "SelectMarketingSectForDelete";
      document.wMLCMarketing.submit( );
   }
}

function SelectMarketingSectForUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketing.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "SelectMarketingSectForUpdate";
      document.wMLCMarketing.submit( );
   }
}

function smEditMasterLabelVersionData( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditMasterLabelVersionData";
      document.wMLCMarketing.submit( );
   }
}

function smEditIngredientsSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditIngredientsSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditStorDispSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditStorDispSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditHumanHazardSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditHumanHazardSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditPrecautionarySect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditPrecautionarySect";
      document.wMLCMarketing.submit( );
   }
}

function smEditFirstAidSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditFirstAidSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditHazardSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditHazardSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditClaimsSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditClaimsSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditSurfacesSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditSurfacesSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditAreasOfUseSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditAreasOfUseSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditAppTypesSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditAppTypesSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditDirectionsUseSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditDirectionsUseSect";
      document.wMLCMarketing.submit( );
   }
}

function smEditMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smEditMarketingSect";
      document.wMLCMarketing.submit( );
   }
}

function smGOTO_ListUsageEntries( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smGOTO_ListUsageEntries";
      document.wMLCMarketing.submit( );
   }
}

function smGOTO_CompositeEntries( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smGOTO_CompositeEntries";
      document.wMLCMarketing.submit( );
   }
}

function smGOTO_CompositeWO_Usage( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "smGOTO_CompositeWO_Usage";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mProductManagement";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mSubregistrants";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mTrackingNotificationCompliance";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mStateRegistrations";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mMarketingFulfillment";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mWebDevelopment";
      document.wMLCMarketing.submit( );
   }
}

function mAdministration( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmAdministration" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wMLCMarketing.zAction.value = "mAdministration";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "mLogin";
      document.wMLCMarketing.submit( );
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

      document.wMLCMarketing.zAction.value = "_OnUnload";
      document.wMLCMarketing.submit( );
   }
}

