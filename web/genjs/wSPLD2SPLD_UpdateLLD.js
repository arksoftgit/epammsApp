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
   if ( _IsDocDisabled( ) === false )
   {
      var tStart   = new Date();

      alert( "Your session will timeout in one minute.  Please click 'OK' within that time to continue and save your work if necessary." );

      var tEnd   = new Date();
      var tDiff = tEnd.getTime() - tStart.getTime();

      // If the time is less than one minute, resubmit the page.  Otherwise, go to the timeout window.
      if (tDiff < 60000)
      {
         document.wSPLD2SPLD_UpdateLLD.zAction.value = "_OnResubmitPage";
         document.wSPLD2SPLD_UpdateLLD.submit( );
      }
      else
      {
         _OnTimeout( );
      }
   }
}

function _OnTimeout( )
{
   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "_OnTimeout";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function _BeforePageUnload( )
{
   if ( _IsDocDisabled( ) === false )
   {
      // If the user clicked on the window close box, then
      // isWindowClosing will be true.  Otherwise if the user
      // clicked on something else in the page, isWindowClosing will be false.
      // If the user clicked the window close box, unregister zeidon.
      if (isWindowClosing)
      {
         document.wSPLD2SPLD_UpdateLLD.zAction.value = "_OnUnload";
         document.wSPLD2SPLD_UpdateLLD.submit( );
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
         if ( theForm.elements[ k ].name === "zDisable" )
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

   if ( bDisabled && timerID !== null )
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
         if (theForm.elements[ k ].disabled === true)
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

         if ( type === "button" || type === "submit" || (type !== null && type.indexOf( "select" ) === 0) )
         {
            theForm.elements[ k ].disabled = bDisabled;
         }
         else
         if ( theForm.elements[ k ].name === "zDisable" )
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

   var szFocusCtrl = document.wSPLD2SPLD_UpdateLLD.zFocusCtrl.value;
   if ( szFocusCtrl !== "" && szFocusCtrl !== "null" )
      eval( 'document.wSPLD2SPLD_UpdateLLD.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSPLD2SPLD_UpdateLLD.zError.value;
   if ( szMsg !== "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSPLD2SPLD_UpdateLLD.zOpenFile.value;
   if ( szMsg !== "" )
   {
      var NewWin = window.open( szMsg );
      if ( NewWin )
         NewWin.focus( );
      else
      {
         alert( "Pop-up windows are being blocked.  You need to set your browser to allow pop-ups from this site for this action to work." );
      }
   }

   document.wSPLD2SPLD_UpdateLLD.zError.value = "";
   document.wSPLD2SPLD_UpdateLLD.zOpenFile.value = "";

   if ( timerID !== null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSPLD2SPLD_UpdateLLD.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * 180;  // 3 hours
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

   while ( (wcontrol = wcontrols[ i++ ]) !== null )
   {
      //Check to see if the checkbox belongs to this table then check it.
      if ( wcontrol.name.indexOf( CheckBoxName ) !== -1 && wcontrol.type === 'checkbox' )
      {
         wcontrol.checked = check;
      }
   }
}

function GOTO_UpdateBlockComponent()
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_UpdateBlockComponent";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function CancelAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "CancelAndReturn";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function CLEAN_SPLD_Data( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "CLEAN_SPLD_Data";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function DeletePanelEntry( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSPLD2SPLD_UpdateLLD.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "DeletePanelEntry";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GENERATE_SPLD_Label( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GENERATE_SPLD_Label";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GENERATE_SPLD_LabelDottedBorders( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GENERATE_SPLD_LabelDottedBorders";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GOTO_AddPanelEntry( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSPLD2SPLD_UpdateLLD.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_AddPanelEntry";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GOTO_DeleteSPLD( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_DeleteSPLD";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GOTO_DisplaySPLD_Components( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_DisplaySPLD_Components";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GOTO_GenerateLLD( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_GenerateLLD";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GOTO_SelectLLD_ForSPLD( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_SelectLLD_ForSPLD";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function GOTO_UpdatePanelEntry( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSPLD2SPLD_UpdateLLD.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "GOTO_UpdatePanelEntry";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function SaveAndReturn( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "SaveAndReturn";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

function SaveSPLD( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) === false )
   {
      _DisableFormElements( true );

      document.wSPLD2SPLD_UpdateLLD.zAction.value = "SaveSPLD";
      document.wSPLD2SPLD_UpdateLLD.submit( );
   }
}

