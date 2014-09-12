var isWindowClosing = true;
var timerID = null;
onerror = handleErr;
window.history.forward( 1 );
var TabACS;

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
         document.wMLCMarketingSection.zAction.value = "_OnResubmitPage";
         document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "_OnTimeout";
      document.wMLCMarketingSection.submit( );
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
         document.wMLCMarketingSection.zAction.value = "_OnUnload";
         document.wMLCMarketingSection.submit( );
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

   var szFocusCtrl = document.wMLCMarketingSection.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wMLCMarketingSection.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wMLCMarketingSection.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wMLCMarketingSection.zOpenFile.value;
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

   document.wMLCMarketingSection.zError.value = "";
   document.wMLCMarketingSection.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wMLCMarketingSection.zTimeout.value;
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

function AcceptMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "AcceptMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function CancelMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "CancelMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function ClearSelectedAppTypes( )
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
               str = name.substr( 0, 10 );
               if ( str.match("GS_AppType") )
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

function ClearSelectedAreasOfUse( )
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
               str = name.substr( 0, 13 );
               if ( str.match("GS_AreasOfUse") )
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
               str = name.substr( 0, 11 );
               if ( str.match("GS_Bacteria") )
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

function ClearSelectedFungi( )
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
               str = name.substr( 0, 8 );
               if ( str.match("GS_Fungi") )
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

function ClearSelectedSurfaces( )
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
               str = name.substr( 0, 10 );
               if ( str.match("GS_Surface") )
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

function ClearSelectedViruses( )
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
               str = name.substr( 0, 8 );
               if ( str.match("GS_Virus") )
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

function SelectMarketingStmtForDelete( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "SelectMarketingStmtForDelete";
      document.wMLCMarketingSection.submit( );
   }
}

function InitMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var thisLi;

// if ( keyRole == "P" || keyRole == "N" ) // If we are here, we have to be a Primary.
   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   thisLi = document.getElementById( "lmStateRegistrations" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   // Cannot go to product management if already there.
   thisLi = document.getElementById( "lmProductManagement" );
   thisLi.disabled = true;

      // END of Javascript code entered by user.

   }
}

function MoveMarketingStmtDown( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "MoveMarketingStmtDown";
      document.wMLCMarketingSection.submit( );
   }
}

function MoveMarketingStmtUp( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "MoveMarketingStmtUp";
      document.wMLCMarketingSection.submit( );
   }
}

function AddNewMarketingStmt( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "AddNewMarketingStmt";
      document.wMLCMarketingSection.submit( );
   }
}

function NextMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "NextMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function PreviousMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "PreviousMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function SaveAddNewMarketingSect( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "SaveAddNewMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function SelectAllAppTypes( )
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
               str = name.substr( 0, 10 );
               if ( str.match("GS_AppType") )
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

function SelectAllAreas( )
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
               str = name.substr( 0, 13 );
               if ( str.match("GS_AreasOfUse") )
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
               str = name.substr( 0, 11 );
               if ( str.match("GS_Bacteria") )
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

function SelectAllFungi( )
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
               str = name.substr( 0, 8 );
               if ( str.match("GS_Fungi") )
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

function SelectAllSurfaces( )
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
               str = name.substr( 0, 10 );
               if ( str.match("GS_Surface") )
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

function SelectAllViruses( )
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
               str = name.substr( 0, 8 );
               if ( str.match("GS_Virus") )
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

function SelectAreasOfUseStmtForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "SelectAreasOfUseStmtForUpdate";
      document.wMLCMarketingSection.submit( );
   }
}

function SelectMarketingStmtForUpdate( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.wMLCMarketingSection.zTableRowSelect.value = strEntityKey;
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "SelectMarketingStmtForUpdate";
      document.wMLCMarketingSection.submit( );
   }
}

function smNextMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "smNextMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function smPreviousMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "smPreviousMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function smAcceptMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "smAcceptMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function smSaveAddNewMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "smSaveAddNewMarketingSect";
      document.wMLCMarketingSection.submit( );
   }
}

function smCancelMarketingSect( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wMLCMarketingSection.zAction.value = "smCancelMarketingSect";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mProductManagement";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mSubregistrants";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mTrackingNotificationCompliance";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mStateRegistrations";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mMarketingFulfillment";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mWebDevelopment";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mAdministration";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "mLogin";
      document.wMLCMarketingSection.submit( );
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

      document.wMLCMarketingSection.zAction.value = "_OnUnload";
      document.wMLCMarketingSection.submit( );
   }
}

