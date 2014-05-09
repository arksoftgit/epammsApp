//<!-- This script and many more are available free online at -->
//<!-- The JavaScript Source!! http://javascript.internet.com -->

//<!-- Begin

function _Stripe( tableId )
{
   // Obtain a reference to the desired table.  If no such table exists, abort.
   var table = document.getElementById( tableId );
   if ( !table )
      return;

   var bEven = 0; // flag used to keep track of whether the current row is odd or even

   // If arguments are provided to specify the colors of the even & odd rows, then use them;
   // otherwise use the following defaults:
   var evenColor = arguments[ 1 ] ? arguments[ 1 ] : "#fff";
   var oddColor = arguments[ 2 ] ? arguments[ 2 ] : "#eee";

   // By definition, tables can have more than one tbody element, so we'll have to get the
   // list of child <tbody> elements and iterate through them.
   var aTbodys = table.getElementsByTagName( "tbody" );
// var nLth = aTbodys.length;
// window.alert( "tbody " + nLth.toString( ) );
   for ( var k = 0; k < aTbodys.length; k++ )
   {
      // Find all the <tr> elements and iterate through them.
      var aTrs = aTbodys[ k ].getElementsByTagName( "tr" );
   // nLth = aTrs.length;
   // window.alert( "tr " + nLth.toString( ) );
      for ( var j = 0; j < aTrs.length; j++ )
      {
         // Avoid rows that have a class attribute or backgroundColor style.
      // if ( !hasClass( aTrs[ j ] ) && !aTrs[ j ].style.backgroundColor )
         {
            // Get all the cells in this row and iterate through them.
            var aTds = aTrs[ j ].getElementsByTagName( "td" );
         // nLth = aTds.length;
         // window.alert( "td " + nLth.toString( ) );
            for ( var i = 0; i < aTds.length; i++ )
            {
               var td1 = aTds[ i ];

               // Avoid cells that have a class attribute or backgroundColor style.
            // if ( !hasClass( td1 ) && !td1.style.backgroundColor )
               {
                  td1.style.backgroundColor = bEven ? evenColor : oddColor;
               }
            }
         }

         // Flip from odd to even, or vice-versa.
         bEven = !bEven;
      }
   }
}

function _SetDataType( cValue )
{
   // This function converts dates and numbers for proper array sorting when in the sort function.
   var isDate = new Date( cValue );
   if ( isDate == "NaN" )
   {
      if ( isNaN( cValue ) )
      {
         // The value is a string, make all characters in string upper case to assure proper a-z sort.
         cValue = cValue.toUpperCase( );
         return cValue;
      }
      else
      {
         // Value is a number, to prevent string sorting of a number add an additional digit that
         // is concatenated to the length of the number when it is a string.
         var strNbr = String.fromCharCode( 48 + cValue.length ) + cValue;
         return strNbr;
      }
   }
   else
   {
      // Value to sort is a date, remove all of the punctuation andand return the string number.
      //bug - string and not numerical sort ... (1 - 10 - 11 - 2 - 3 - 4 - 41 - 5  etc.)
      var strDate = new String( );

      strDate = isDate.getFullYear( ) + " " ;
      strDate = strDate + isDate.getMonth( ) + " ";
      strDate = strDate + isDate.getDate( ); + " ";
      strDate = strDate + isDate.getHours( ); + " ";
      strDate = strDate + isDate.getMinutes( ); + " ";
      strDate = strDate + isDate.getSeconds( );
      //strDate = String.fromCharCode( 48 + strDate.length ) + strDate;
      return strDate;
   }
}

function _SortTable( col, table )
{
   var iCurCell = col + table.cols;
   var totalRows = table.rows.length;
   var bSort = 0;
   var colArray = new Array( );
   var oldIndex = new Array( );
   var indexArray = new Array( );
   var bArray = new Array( );
   var newRow;
   var newCell;
   var j;
   var k;
   var c;

   // Populate the array colArray with contents of the column selected.
   for ( k = 1; k < table.rows.length; k++ )
   {
      colArray[ k - 1 ] = _SetDataType( table.cells( iCurCell ).innerText );
      iCurCell = iCurCell + table.cols;
   }

   // Copy array for comparison after sort.
   for ( k = 0; k < colArray.length; k++ )
      bArray[ k ] = colArray[ k ];

   // Sort the column items.
   colArray.sort( );
   for ( k = 0; k < colArray.length; k++ )
   {
      // Loop through the new sorted array.
      indexArray[ k ] = (k + 1);
      for( j = 0; j < bArray.length; j++ )
      {
         // Loop through the old array.
         if ( colArray[ k ] == bArray[ j ] )
         {
            // When the item in the old and new match, place the current row number
            // in the proper position in the new order array so rows can be moved.
            // Make sure current row number is not already in the new order array.
            for ( c = 0; c < k; c++ )
            {
               if ( oldIndex[ c ] == (j + 1) )
               {
                  bSort = 1;
               }
            }

            if ( bSort == 0 )
               oldIndex[ k ] = (j + 1);

            bSort = 0;
         }
      }
   }

   // Sorting complete, add new rows to base of table.
   for ( k = 0; k < oldIndex.length; k++ )
   {
      newRow = table.insertRow( );
      for ( c = 0; c < table.cols; c++ )
      {
         newCell = newRow.insertCell( );
         newCell.innerHTML = table.rows( oldIndex[ k ] ).cells( c ).innerHTML;
      }
   }

   // Move new rows to top of table.
   for ( k = 1; k < totalRows; k++ )
      table.moveRow( (table.rows.length - 1), 1 );

   // Delete the old rows from the bottom of the table.
   for ( k = 1; k < totalRows; k++ )
      table.deleteRow( );

   _Stripe( table.id );
}

//  End -->
