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
         document.wSLCDeleteMarketingSection.zAction.value = "_OnResubmitPage";
         document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "_OnTimeout";
      document.wSLCDeleteMarketingSection.submit( );
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
         document.wSLCDeleteMarketingSection.zAction.value = "_OnUnload";
         document.wSLCDeleteMarketingSection.submit( );
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

   var szFocusCtrl = document.wSLCDeleteMarketingSection.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSLCDeleteMarketingSection.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSLCDeleteMarketingSection.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSLCDeleteMarketingSection.zOpenFile.value;
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

   var keyRole = document.wSLCDeleteMarketingSection.zKeyRole.value;
   document.wSLCDeleteMarketingSection.zError.value = "";
   document.wSLCDeleteMarketingSection.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   document.wSLCDeleteMarketingSection.hTitleBoldItalic.value = document.wSLCDeleteMarketingSection.TitleBoldItalic.value
   document.wSLCDeleteMarketingSection.hNoteBoldItalic.value = document.wSLCDeleteMarketingSection.NoteBoldItalic.value

   var varTimeout = document.wSLCDeleteMarketingSection.zTimeout.value;
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

function CancelDeleteMarketSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "CancelDeleteMarketSection";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function ConfirmDeleteMarketSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "ConfirmDeleteMarketSection";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function DeleteMarketingStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "DeleteMarketingStatement";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function InitMarketingSectForDelete( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var thisLi;

// if ( keyRole == "S" ) // If we are here, we have to be a Subregistrant.
   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   thisLi = document.getElementById( "lmSubregistrants" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   // Cannot go to product management if already there.
   thisLi = document.getElementById( "lmProductManagement" );
   thisLi.disabled = true;

      // END of Javascript code entered by user.

   }
}

function MoveMarketingStatementDown( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSLCDeleteMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "MoveMarketingStatementDown";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function MoveMarketingStatementUp( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSLCDeleteMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "MoveMarketingStatementUp";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function NewMarketingStatement( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "NewMarketingStatement";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function UpdateMarketingStatement( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSLCDeleteMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "UpdateMarketingStatement";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function smConfirmDeleteMarketSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "smConfirmDeleteMarketSection";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function smCancelDeleteMarketSection( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "smCancelDeleteMarketSection";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mProductManagement";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mSubregistrants";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mTrackingNotificationCompliance";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mStateRegistrations";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mMarketingFulfillment";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mWebDevelopment";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mAdministration";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "mLogin";
      document.wSLCDeleteMarketingSection.submit( );
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

      document.wSLCDeleteMarketingSection.zAction.value = "_OnUnload";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function mTemplate( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

   var thisLi = document.getElementById( "lmTemplate" );
   if ( thisLi.disabled == true )
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSLCDeleteMarketingSection.zAction.value = "mTemplate";
      document.wSLCDeleteMarketingSection.submit( );
   }
}

function TitleBoldItalicOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSLCDeleteMarketingSection.hTitleBoldItalic.value = document.wSLCDeleteMarketingSection.TitleBoldItalic.value;
   }
}

function NoteBoldItalicOnChange( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSLCDeleteMarketingSection.hNoteBoldItalic.value = document.wSLCDeleteMarketingSection.NoteBoldItalic.value;
   }
}

