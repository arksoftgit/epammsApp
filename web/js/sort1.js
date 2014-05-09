var splitIndex = 0;
var splitArray = new Array();

function splits( string, text )
{
   var strLength = string.length;
   var txtLength = text.length;
   if ( (strLength == 0) || (txtLength == 0) )
      return;

   var k = string.indexOf( text );
   if ( (k == 0) && (text != string.substring( 0, txtLength )) )
      return;

   if ( k == -1 )
   {
      splitArray[splitIndex++] = string;
      return;
   }

   splitArray[ splitIndex++ ] = string.substring( 0, k );
   
   if ( k + txtLength < strLength )
      splits( string.substring( k + txtLength, strLength ), text );

   return;
}

function join( arrayName )
{
   var temp = '';
   for ( var k = 0; k < splitIndex; k++ )
      temp += arrayName[ k ] + '\n';

   if ( escape( temp.substring( 0, 1 ) ) == '%0A' )
      return temp.substring( 1, temp.length );
   else
      return temp;
}

function sort( arrayName )
{
   for ( var k = 0; k < (splitIndex - 1); k++ )
   {
      for ( var j = k + 1; j < splitIndex; j++ )
	   {
         if ( arrayName[ j ] < arrayName[ k ] )
		   {
            var dummy = arrayName[ k ];
            arrayName[ k ] = arrayName[ j ];
            arrayName[ j ] = dummy;
         }
      }
   }
}

function split( string, text )
{
   splitIndex = 0;
   splits( string, text );
}