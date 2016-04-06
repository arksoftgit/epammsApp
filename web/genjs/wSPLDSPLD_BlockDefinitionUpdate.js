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
         document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "_OnResubmitPage";
         document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
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

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "_OnTimeout";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
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
         document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "_OnUnload";
         document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
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

   var szFocusCtrl = document.wSPLDSPLD_BlockDefinitionUpdate.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSPLDSPLD_BlockDefinitionUpdate.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSPLDSPLD_BlockDefinitionUpdate.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSPLDSPLD_BlockDefinitionUpdate.zOpenFile.value;
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

   var LoginName = document.wSPLDSPLD_BlockDefinitionUpdate.zLoginName.value;
   var keyRole = document.wSPLDSPLD_BlockDefinitionUpdate.zKeyRole.value;
   document.wSPLDSPLD_BlockDefinitionUpdate.zError.value = "";
   document.wSPLDSPLD_BlockDefinitionUpdate.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSPLDSPLD_BlockDefinitionUpdate.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   // Prebuild action has javascript code entered by user.
      var sectionType = sessionStorage.getItem( "epamms_section_type" );
   // alert( "SectionType: " + sectionType );
      if ( sectionType === "Graphic" || sectionType == "ProductName" ||
           sectionType === "HumanHazard" || sectionType == "EPA_RegAndEstNbr" ||
           sectionType === "NetContents" ) { // || sectionType == "FirstAid" ||
       // sectionType === "PhysicalHazard" || sectionType == "Precautionary" ) {
         var thisHide = document.getElementById( "HideBox" );
         thisHide.style.visibility = "hidden";
         thisHide = document.getElementById( "HideInnerBox" );
         thisHide.style.visibility = "hidden";
         thisHide = document.getElementById( "HideText" );
         thisHide.style.visibility = "hidden";
         var thisComponentList = document.getElementById( "GridComponentList" );
         thisComponentList .style.visibility = "hidden";
      }
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

function ACCEPT_BlockSubBlockDefinition( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "ACCEPT_BlockSubBlockDefinition";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function SaveAsReusableBlock( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "SaveAsReusableBlock";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function CANCEL_BlockSubBlockDefinition( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "CANCEL_BlockSubBlockDefinition";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function DELETE_SpecialFormatDef( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "DELETE_SpecialFormatDef";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function GENERATE_SPLD_Label( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      var labelBorders = localStorage.getItem( "epamms_graphic_labelborders" );
      _DisableFormElements( true );
      if ( labelBorders === "Y" ) {
         document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GENERATE_SPLD_LabelDottedBorders";
      } else {
         document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GENERATE_SPLD_Label";
      }
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
      return;

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GENERATE_SPLD_Label";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function GENERATE_SPLD_LabelDottedBorders( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GENERATE_SPLD_LabelDottedBorders";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function GOTO_NewSpecialFormatDefinition( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GOTO_NewSpecialFormatDefinition";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function GOTO_SelectMarketingSection( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GOTO_SelectMarketingSection";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function GOTO_UpdateSpecialFormatDef( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSPLDSPLD_BlockDefinitionUpdate.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GOTO_UpdateSpecialFormatDef";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function GOTO_UpdateSPLD_Statement( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wSPLDSPLD_BlockDefinitionUpdate.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "GOTO_UpdateSPLD_Statement";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function PrebuildBlockDefinitionUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "PrebuildBlockDefinitionUpdate";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

function SelectReusableBlock( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSPLDSPLD_BlockDefinitionUpdate.zAction.value = "SelectReusableBlock";
      document.wSPLDSPLD_BlockDefinitionUpdate.submit( );
   }
}

