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
         document.wSystemDragDropSort.zAction.value = "_OnResubmitPage";
         document.wSystemDragDropSort.submit( );
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

      document.wSystemDragDropSort.zAction.value = "_OnTimeout";
      document.wSystemDragDropSort.submit( );
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
         document.wSystemDragDropSort.zAction.value = "_OnUnload";
         document.wSystemDragDropSort.submit( );
      }
   }
}

function _IsDocDisabled( )
{
   var bRC = false;

   var $el = $("#zDisable");
   if ( $el.length > 0 ) {
      bRC = $el.prop( "disabled" );
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
      $el.prop( "disabled", bDisabled );
      bRC = true;
   }

// $.blockUI({ message: '<h1><img src="./images/busy.gif" /></h1>', overlayCSS: { backgroundColor: '#eee' } });
   return bRC;
}

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wSystemDragDropSort.zFocusCtrl.value;
   if ( szFocusCtrl != "" && szFocusCtrl != "null" )
      eval( 'document.wSystemDragDropSort.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSystemDragDropSort.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSystemDragDropSort.zOpenFile.value;
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

   var keyRole = document.wSystemDragDropSort.zKeyRole.value;
   document.wSystemDragDropSort.zError.value = "";
   document.wSystemDragDropSort.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSystemDragDropSort.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   $(function() {
      $( "#DraggableSortTable" ).sortable();
      $( "#DraggableSortTable" ).disableSelection();

      var fixCloneColumnWidths = function(e, tr) {
         var $originals = tr.children();
         var $helper = tr.clone();
         $helper.children().each(function(index) { // when dragging the row, maintains widths of columns within clone
            $(this).width($originals.eq(index).width());
         });
         return $helper;
      },
      updateOddEven = function(e, ui) { // reset the odd/even row class
         $('td.index', ui.item.parent()).each(function (k) {
            // $(this).html(k + 1); // uncomment to have row index change to new order
            if ( k % 2 ) {
               // console.log( "adding class odd at: " + k );
               $(this).closest("tr").addClass( "odd" );
            } else {
               // console.log( "removing class odd at: " + k );
               $(this).closest("tr").removeClass( "odd" );
            }
         });
      };

      $("#DraggableSortTable tbody").sortable({
         helper: fixCloneColumnWidths,
         stop: updateOddEven
      }).disableSelection();    

   });


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

function ApplySortOrder( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      // Need some javascript here to apply the sort order
      var arrRowOrderIdx = getSortOrderArray( "DraggableSortTable" );
      document.wSystemDragDropSort.zOrderArray.value = arrRowOrderIdx.toString();


      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemDragDropSort.zAction.value = "ApplySortOrder";
      document.wSystemDragDropSort.submit( );
   }
}

function CancelSortDiv( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

      // This is where we add the cancel sort javascript

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemDragDropSort.zAction.value = "CancelSortDiv";
      document.wSystemDragDropSort.submit( );
   }
}

function mLogout( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemDragDropSort.zAction.value = "_OnUnload";
      document.wSystemDragDropSort.submit( );
   }
}

function mApplySortOrder( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

      // Need some javascript here to apply the sort order
      var arrRowOrderIdx = getSortOrderArray( "DraggableSortTable" );
      document.wSystemDragDropSort.zOrderArray.value = arrRowOrderIdx.toString();


      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemDragDropSort.zAction.value = "mApplySortOrder";
      document.wSystemDragDropSort.submit( );
   }
}

function mCancelSortDiv( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {

      // Javascript code entered by user.

      // This is where we add the cancel sort javascript

      // END of Javascript code entered by user.

      _DisableFormElements( true );

      document.wSystemDragDropSort.zAction.value = "mCancelSortDiv";
      document.wSystemDragDropSort.submit( );
   }
}

function mmLogout( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSystemDragDropSort.zAction.value = "_OnUnload";
      document.wSystemDragDropSort.submit( );
   }
}
/*
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order Array Entity: S_MarketingUsageOrdering
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order Array subscript: 3,4,1,2
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order array index length: 4
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order array index[0] = 2
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order array index[1] = 3
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order array index[2] = 0
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Order array index[3] = 1
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] Before orderByNewIndex
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3473  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (1)  ATCC and antibiotic-resistant strain
INFO  21:48:45,567  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3474  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (2)  antibiotic-resistant strain only
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3475  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Acinetobacter calcoaceticus
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3476  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Bordetella bronchiseptica
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] k = 0  shifts: 0
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] After swap (1)
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3475  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Acinetobacter calcoaceticus
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3473  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (1)  ATCC and antibiotic-resistant strain
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3474  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (2)  antibiotic-resistant strain only
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3476  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Bordetella bronchiseptica
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] j = 0  Array Shift[0] : 2
INFO  21:48:45,568  [8AEFCFBCDA702B9CBFA4376A5334504D] k = 1  shifts: 1
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] arrIdx bounds error ???  arrIdx[1] 1 (4)
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3475  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Acinetobacter calcoaceticus
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3473  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (1)  ATCC and antibiotic-resistant strain
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3474  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (2)  antibiotic-resistant strain only
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3476  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Bordetella bronchiseptica
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] After orderByNewIndex Swaps: 1
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3475  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Acinetobacter calcoaceticus
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3473  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (1)  ATCC and antibiotic-resistant strain
INFO  21:48:45,569  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3474  C   S_MarketingUsage.dDisplayUsageName: Bacteria - (2)  antibiotic-resistant strain only
INFO  21:48:45,625  [8AEFCFBCDA702B9CBFA4376A5334504D] S_MarketingUsage.UsageType: 3476  C   S_MarketingUsage.dDisplayUsageName: Bacteria - Bordetella bronchiseptica
*/