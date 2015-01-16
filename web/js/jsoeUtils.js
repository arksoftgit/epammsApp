"use strict";
// we need tabs as spaces and not CSS magin-left in order to retain format when copying and pasting the code
window.SINGLE_TAB = "  ";
window.DOUBLE_TAB = MultiplyString( 2, window.SINGLE_TAB );
window.ImgCollapsed = "images/plus.gif";
window.ImgExpanded = "images/minus.gif";
window.QuoteKeys = true;
window._dateObj = new Date();
window._regexpObj = new RegExp();
window.IsCollapsible = true;
window.ViewMeta = true;
// window.screen.width;
// window.screen.height;
// The screen.DeviceXDPI and screen.DeviceYDPI give you an idea about the pixel density of the display device.constructor.
// So the screen.availWidth/screen.DeviceXDPI will give you the width in inches
// and screen.availHeight/screen.DeviceYDPI gives you the height in inches.

// From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
var emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/
function updateTips( t ) {
/*
   allFields = $( [] ).add( name ).add( email ).add( password ),
   tips
      .text( t )
      .addClass( "ui-state-highlight" );
   setTimeout(function() {
      tips.removeClass( "ui-state-highlight", 1500 );
   }, 500 );
*/
}

function checkLength( o, n, min, max ) {
   if ( o.val().length > max || o.val().length < min ) {
      o.addClass( "ui-state-error" );
      updateTips( "Length of " + n + " must be between " + min + " and " + max + "." );
      return false;
   } else {
      return true;
   }
}

function checkRegexp( o, regexp, n ) {
   if ( !( regexp.test( o.val() ) ) ) {
      o.addClass( "ui-state-error" );
      updateTips( n );
      return false;
   } else {
      return true;
   }
}
/*
function addUser() {
   var valid = true;
   allFields.removeClass( "ui-state-error" );

   valid = valid && checkLength( name, "username", 3, 16 );
   valid = valid && checkLength( email, "email", 6, 80 );
   valid = valid && checkLength( password, "password", 5, 16 );

   valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
   valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
   valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
 
   if ( valid ) {
      $( "#users tbody" ).append( "<tr>" +
         "<td>" + name.val() + "</td>" +
         "<td>" + email.val() + "</td>" +
         "<td>" + password.val() + "</td>" +
      "</tr>" );
      dialog.dialog( "close" );
   }
   return valid;
}
*/

// metacharacters are: <([{\^-=$!|]})?*+.>
// ^[a-zA-Z]*[a-zA-Z0-9].\D[a-zA-Z0-9].\D[a-zA-Z0-9]

function $id(id){ return document.getElementById( id ); }
/*
function IsArray( obj ) {
   var a = $.isArray( obj );
   var b = obj &&
          typeof obj === "object" &&
          typeof obj.length === "number" &&
          !(obj.propertyIsEnumerable( "length" ));
   if ( a != b ) {
      console.log( "Different evaluations of IsArray" );
   }
   return a;
}
*/

// Check for a valid object.
function isValidObject( obj ) {
  if ( obj === null || typeof( obj ) === "undefined" ) {
     return false;
  }
  return true;
}

// Remove an item from an array.
function remove( array, index ) {
   return array.slice( 0, index ).concat( array.slice( index + 1 ) );
}

// Generic equality test.
function deepEqual( a, b ) {
   if ( a !== null && b !== null && typeof a === "object" && typeof b === "object" ) {
      if ( a.length !== b.length ) {
         return false;
      }
      for ( var prop in a ) {
         if ( deepEqual( a[prop], b[prop] ) === false ) {
            return false;
         }
      }
      return true;
   } else {
      return a === b;
   }
}

function jsonStringToJsonObject( jsonString ) {
   // var jsonObject = eval( "[" + jsonString + "]" );
   var jsonObject = jQuery.parseJSON( "[" + jsonString + "]" );  // this is faster and more secure than eval (above)
   return jsonObject;
}

function simpleTraverseJsonObject( jsonObject ) {
   if ( typeof jsonObject === "object" ) {
      $.each( jsonObject, function( key, value ) {
         // key is either an array index or object key
         simpleTraverseJsonObject( value );
      });
   } else if ( jsonObject !== null ) {
      // jsonObj is a number or string
      console.log( jsonObject );
   }
}

function findOiByName( oiName, jsonObject ) {
   var returnObj = null;
   if ( typeof jsonObject === "object" ) {
      // To break out of a $.each loop, you have to return false in the loop callback.
      // Returning true skips to the next iteration, equivalent to a continue in a normal loop.
      $.each( jsonObject, function( key, value ) {
         if ( key === oiName ) {
            returnObj = jsonObject;
            return false;
         }
         // key is either an array index or object key
         returnObj = findOiByName( oiName, value );
         if ( returnObj ) {
            return false;
         }
      });
/* } else if ( jsonObject !== null ) {
      if ( typeof jsonObject === "string" ) {
         console.log( jsonObject );
      } */
   }
   return returnObj;
}

function trimLeadingAndTrailingWhiteSpace( text ) {  // should be equivalent to javascript trim
   return text.replace( /^\s+|\s+$/g, "" ); // at least one white-space character following start-of-line OR
                                            // at least one white-space character preceding end-of-line AND do-em-all (/g).
}

function trimLeadingWhiteSpace( text ) { // at least one white-space character following start-of-line
   return text.replace( /^\s+/, "" );
}

function stripTrailingWhiteSpace( text ) {
   return text.replace( /\s+$/, "" ); // at least one white-space character preceding end-of-line
}

function isWhiteSpace( ch ) {
   return " \t\n\r\v".indexOf( ch ) >= 0; // space tab line-feed carriage-return vertical-tab
}

function capitalize( text ) {
   return text.charAt( 0 ).toUpperCase() + text.slice( 1 ).toLowerCase();
}

if (typeof( String.prototype.localeCompare) === "undefined" ) {
   String.prototype.localeCompare = function( s, locale, options ) {
      return ((this === s) ? 0 : ((this > s) ? 1 : -1));
   };
}

function strcmp( s1, s2 ) {
   return ((s1 === s2) ? 0 : ((s1 > s2) ? 1 : -1));
}

function MultiplyString( num, str ) {
   var sb =[];
   for ( var k = 0; k < num && k < 10; k++ ) {
      sb.push( str );
   }
   return sb.join( "" );
}

function buildTab( indent, file ) {
   var tab = "";
   for ( var k = 0; k < indent && k < 100; k++ ) {
      if ( file ) {
         tab += window.SINGLE_TAB;
      } else {
         tab += window.DOUBLE_TAB;
      }
   }
   return tab;
}
/*
// sort attempting to minimize moves.
var arrayOriginal = [ "A", "B", "C", "D", "E", "F", "G" ];
var arrayOrderIndex0 = [ 1, 2, 4, 3, 5, 6, 0 ];
var arrayOriginal0 = [ "A", "B", "C", "D", "E", "F", "G" ];
var arrayOrderIndex1 = [ 6, 0, 1, 2, 3, 4, 5 ];
var arrayOriginal1 = [ "A", "B", "C", "D", "E", "F", "G" ];
var arrayOrderIndex2 = [ 1, 2, 3, 4, 5, 6, 0 ];
var arrayOriginal2 = [ "A", "B", "C", "D", "E", "F", "G" ];
var arrayOrderIndex3 = [ 0, 1, 3, 2, 4, 6, 5 ];
var arrayOriginal3 = [ "A", "B", "C", "D", "E", "F", "G" ];
*/
function moveItem( oldIdx, newIdx, arr ) {
   var n = arr.length;
   if ( oldIdx >= 0 && oldIdx < n && newIdx >= 0 && newIdx < n ) {
      var k;
   // var item = arr.slice( oldIdx, 1 ); // to remove one element without leaving "holes" in the array:

   // delete arr[oldIdx]; // changes the element to undefined ... we want the hole ... will fill it back up.
      var item = arr[oldIdx];
      if ( oldIdx < newIdx ) {
         for ( k = oldIdx; k < newIdx; k++ ) {
            arr[k] = arr[k + 1];
         }
      } else {
         for ( k = oldIdx; k > newIdx; k-- ) {
            arr[k] = arr[k - 1];
         }
      }
      arr[newIdx] = item;
   }
}

function orderByNewIndex( arrIdx, arrayOrig ) {
   var swaps = 0;
   var n = arrIdx.length;
   var arrShift = []; // new Array( arrIdx.length );
   var shiftMax = 0;
   var shifts;
   var k, j;
   console.log( "Order index: " + arrIdx[0] + ", " +
                                    arrIdx[1] + ", " +
                                    arrIdx[2] + ", " +
                                    arrIdx[3] + ", " +
                                    arrIdx[4] + ", " +
                                    arrIdx[5] + ", " +
                                    arrIdx[6] );
   console.log( "Original array: " + arrayOrig[0] + ", " +
                                       arrayOrig[1] + ", " +
                                       arrayOrig[2] + ", " +
                                       arrayOrig[3] + ", " +
                                       arrayOrig[4] + ", " +
                                       arrayOrig[5] + ", " +
                                       arrayOrig[6] );
   for ( k = 0; k < n - 1; k++ ) {
      // find the number of times we have shifted the current index because of a move
      shifts = 0;
      for ( j = 0; j < shiftMax; j++ ) {
         if ( k < arrShift[j] ) {
            shifts++;
         }
      }
      // var arrayOrderIndex = [ 0, 1, 3, 2, 4, 6, 5 ];
      if ( arrIdx[k] + shifts > k ) {
         if ( arrIdx[k] + shifts >= 0 && arrIdx[k] + shifts < n ) {
            if ( arrIdx[k] + shifts > k + 1 ) {
               arrShift[shiftMax++] = arrIdx[k];
            }
            moveItem( arrIdx[k] + shifts, k, arrayOrig );
            console.log( "After move (with shift: " + shifts + ") from: " + arrIdx[k] + " to: " + k + "   " +
                                                arrayOrig[0] + ", " +
                                                arrayOrig[1] + ", " +
                                                arrayOrig[2] + ", " +
                                                arrayOrig[3] + ", " +
                                                arrayOrig[4] + ", " +
                                                arrayOrig[5] + ", " +
                                                arrayOrig[6] );
            swaps++;
         } else {
            break; // error???
         }
      }
   }
   console.log( "Swaps: " + swaps + "  final array: " +
                        arrayOrig[0] + ", " +
                        arrayOrig[1] + ", " +
                        arrayOrig[2] + ", " +
                        arrayOrig[3] + ", " +
                        arrayOrig[4] + ", " +
                        arrayOrig[5] + ", " +
                        arrayOrig[6] );

   console.log( "Expected final array: " +
                        arrayOriginal[arrIdx[0]] + ", " +
                        arrayOriginal[arrIdx[1]] + ", " +
                        arrayOriginal[arrIdx[2]] + ", " +
                        arrayOriginal[arrIdx[3]] + ", " +
                        arrayOriginal[arrIdx[4]] + ", " +
                        arrayOriginal[arrIdx[5]] + ", " +
                        arrayOriginal[arrIdx[6]] );
}

var karrayOriginal0 = [ 0, 1, 2, 3, 4, 5, 6];
var karrayOrderIndex0 = [ 1, 2, 4, 3, 5, 6, 0 ];
var karrayOriginal1 = [ 0, 1, 2, 3, 4, 5, 6];
var karrayOrderIndex1 = [ 6, 0, 1, 2, 3, 4, 5 ];
var karrayOriginal2 = [ 0, 1, 2, 3, 4, 5, 6];
var karrayOrderIndex2 = [ 1, 2, 3, 4, 5, 6, 0 ];
var karrayOriginal3 = [ 0, 1, 2, 3, 4, 5, 6];
var karrayOrderIndex3 = [ 0, 1, 3, 2, 4, 6, 5 ];

function korderbyIndex( arrIdx, arrayOrig ) {
   var k = 0;
   var swaps = 0;
   while( k < arrayOrig.length )
   {
      if ( arrayOrig[k] === arrIdx[k] )
         k++;
      else
      {
         swaps++;
         moveItem( arrayOrig.length - 1, k, arrayOrig );
         // arrayOrig.move(i, arrayOrig.length()-1);
      }
   }
   console.log( "final karray swaps(" + swaps + "): " +
           arrayOriginal[arrayOrig[0]] + ", " +
           arrayOriginal[arrayOrig[1]] + ", " +
           arrayOriginal[arrayOrig[2]] + ", " +
           arrayOriginal[arrayOrig[3]] + ", " +
           arrayOriginal[arrayOrig[4]] + ", " +
           arrayOriginal[arrayOrig[5]] + ", " +
           arrayOriginal[arrayOrig[6]] );
}

// </style>
// #DragDropSortableGrid { list-style-type: none; margin: 0; padding: 0; width: 60%; }
// #DragDropSortableGrid li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
// #DragDropSortableGrid li span { position: absolute; margin-left: -1.3em; }
// </style>
// <script>
   $(function() {
      $( "#DragDropSortableGrid" ).sortable();
      $( "#DragDropSortableGrid" ).disableSelection();


      var fixHelperModified = function(e, tr) {
         var $originals = tr.children();
         var $helper = tr.clone();
         $helper.children().each(function(index) {
            $(this).width($originals.eq(index).width());
         });
         return $helper;
      },
      updateIndex = function(e, ui) {
         $('td.index', ui.item.parent()).each(function (k) {
            // $(this).html(k + 1);
            if ( k % 2 ) {
               // console.log( "adding class odd at: " + k );
               $(this).closest("tr").addClass( "odd" );
            } else {
               // console.log( "removing class odd at: " + k );
               $(this).closest("tr").removeClass( "odd" );
            }
         });
      };

      $("#DragDropSortableGrid tbody").sortable({
         helper: fixHelperModified,
         stop: updateIndex
      }).disableSelection();

   });
// </script>

// SimpleHashMap - superclass
var SimpleHashMap = function( keyType, valueType ) {
   this._db = [];
   this._keyType = keyType;
   this._valueType = valueType;
   return this;
};

SimpleHashMap.prototype.getIndexOfKey = function( key ) {
   if ( typeof key !== this._keyType ) {
      throw new Error( "Type of key should be: " + this._keyType + "  Not: " + typeof key );
   }
   for ( var k = 0; k < this._db.length; k++ ) {
      if ( this._db[k][0] === key ) {
         return k;
      }
   }
   return -1;
};

SimpleHashMap.prototype.add = function( key, value ) {
   if ( typeof key !== this._keyType ) {
      throw new Error( "Type of key should be: " + this._keyType + "  Not: " + typeof key );
   } else if ( value !== null && typeof value !== this._valueType ) {
      throw new Error( "Type of value should be: " + this._valueType + "  Not: " + typeof value );
   }
   var index = this.getIndexOfKey( key );
   if ( index === -1 ) {
      this._db.push( [key, value] );
   } else {
      this._db[index][1] = value;
   }
   return this;
};

SimpleHashMap.prototype.get = function( key ) {
   if ( this._db.length > 0 && typeof key === this._keyType ){
      for ( var k = 0; k < this._db.length; k++ ) {
         if ( this._db[k][0] === key ) {
            return this._db[k][1];
         }
      }
   }
   return null;
};

SimpleHashMap.prototype.size = function() {
   return this._db.length;
};

SimpleHashMap.prototype.keys = function() {
   var result = [];
// console.log( "SimpleHashMap.keys length: " + this._db.length );
   for ( var k = 0; k < this._db.length; k++ ) {
   // console.log( "SimpleHashMap.keys pushing: " + this._db[k][0] );
      result.push( this._db[k][0] );
   }
   return result;
};

SimpleHashMap.prototype.values = function() {
   var result = [];
   for ( var k = 0; k < this._db.length; k++ ) {
      result.push( this._db[k][1] );
   }
   return result;
};

SimpleHashMap.prototype.iterate = function( callback ) {
   if ( this._db.length === 0 ) {
      return false;
   }
   for ( var k = 0; k < this._db.length; k++ ) {
      callback( this._db[k][0], this._db[k][1] );
   }
   return true;
};

/*
SimpleHashMap.prototype.randomize = function () {
   if ( _db.length === 0 ) {
      return this;
   }
   var currentIndex = db.length
   var temporaryValue;
   var randomIndex;
   while ( currentIndex !== 0 ) {
      randomIndex = Math.floor( Math.random() * currentIndex );
      currentIndex--;
      temporaryValue = db[currentIndex];
      db[currentIndex] = db[randomIndex];
      db[randomIndex] = temporaryValue;
   }
   return this;
}
*/

SimpleHashMap.prototype.swapItems = function( idx1, idx2 ) {
   if ( idx1 >= 0 && idx1 < this._db.length && idx2 >= 0 && idx2 < this._db.length  ) {
      var item = this._db[idx1];
      this._db[idx1] = this._db[idx2];
      this._db[idx2] = item;
      return true;
   } else {
      return false;
   }
};

SimpleHashMap.prototype.removeItem = function( key ) {
   var item = null;
   var k = this.getIndexOfKey( key );
   if ( k >= 0 ) {
      item = this._db[k][1];
      this._db = remove( this._db, k );
   /*
      while ( k < this._db.length ) {
         this._db[k][0] = this._db[k + 1][0];
         this._db[k][1] = this._db[k + 1][1];
         k++;
      }
      this._db.length--;
      this._db[_db.length][0] = null;
      this._db[_db.length][1] = null;
   */
   }
   return item;
};

SimpleHashMap.prototype.clear = function() {
   this._db.length = 0;
   this._db = [];
};

SimpleHashMap.prototype.toString = function( message ) {
   var s = message + ":: ";
   for ( var k = 0; k < this._db.length; k++ ) {
      s += " " + k + ": " + this._db[k][0];
   }
   return s;
};

function testSimpleHashMap() {
   var a = new SimpleHashMap( "string", "string" );
   a.add("test", "1132")
    .add("test14", null)
    .add("1421test14", "12312666")
    .iterate( function( key, value ) { console.log( "a[" + key + "]=" + value ); } );
   /*
   a[test]=1132
   a[test14]=666
   a[1421test14]=12312666
   */
  /*
   a.randomize().iterate( function( key, value ) { console.log( "a[" + key + "]=" + value ); } );
   a.randomize().iterate( function( key, value ) { console.log( "a[" + key + "]=" + value ); } );
   a.randomize().iterate( function( key, value ) { console.log( "a[" + key + "]=" + value ); } );
   a.randomize().iterate( function( key, value ) { console.log( "a[" + key + "]=" + value ); } );
   */
   /*
   a[1421test14]=12312666
   a[test]=1132
   a[test14]=666
   */
}

/** not yet implemented

var JsonHashMap = function( keyType, valueType, jsonString ) {  // added jsonString parameter
   var _db = [];
   var _keyType;
   var _valueType;

   (function() {
      _keyType = keyType;
      _valueType = valueType;
      // added
      if ( jsonString ) {
         var jsonObject = jsonStringToJsonObject( jsonString );
         jsonObjectToHashMap( jsonObject, _db );
      }
      // end added
   })();

   var getIndexOfKey = function( key ) {
      if ( typeof key !== _keyType ) {
         throw new Error( "Type of key should be: " + _keyType + "  Not: " + typeof key );
      }
      for ( var k = 0; k < _db.length; k++ ) {
         if ( _db[k][0] === key ) {
            return k;
         }
      }
      return -1;
   };

   this.add = function( key, value ) {
      if ( typeof key !== _keyType ) {
         throw new Error( "Type of key should be: " + _keyType + "  Not: " + typeof key );
      } else if ( value !== null && typeof value !== _valueType ) {
         throw new Error( "Type of value should be: " + _valueType + "  Not: " + typeof value );
      }
      var index = getIndexOfKey( key );
      if ( index === -1 ) {
         _db.push( [key, value] );
      } else {
         _db[index][1] = value;
      }
      return this;
   };

   this.get = function( key ) {
      if ( typeof key !== _keyType || _db.length === 0 ){
         return null;
      }
      for ( var k = 0; k < _db.length; k++ ) {
         if ( _db[k][0] === key ) {
            return _db[k][1];
         }
      }
      return null;
   };

   this.size = function() {
      return _db.length;
   };

   this.keys = function() {
      if ( _db.length === 0 ) {
         return [];
      }
      var result = [];
      for ( var k = 0; k < _db.length; k++ ) {
         result.push( _db[k][0] );
      }
      return result;
   };

   this.values = function() {
      if ( _db.length === 0 ) {
         return [];
      }
      var result = [];
      for ( var k = 0; k < _db.length; k++ ) {
         result.push( _db[k][1] );
      }
      return result;
   };

   // Added to support initializing a JsonHashMap from a JSON object ... not yet implemented!
   this.jsonToHash = function( jsonObject ) {
      var typeObj = typeof jsonObject;
      if ( typeObj === "object" ) {
         if ( $.isArray( jsonObject ) ) {
            $.each( jsonObject, function( key, value ) {
               add( key, value );
         });
         }
      }
   };

   this.toString = function() {
      var result;
      if ( _db.length > 0 ) {
         result = "{ ";
         for ( var k = 0; k < _db.length; k++ ) {
            result += "{ " + _db[k][0] + " : " + _db[k][1] + " }";
         }
         result += " }";
      } else {
         result = "{}";
      }
      return result;
   };

   this.randomize = function() {
      if ( db.length === 0 ) {
         return this;
      }
      var currentIndex = db.length, temporaryValue, randomIndex;
      while ( 0 !== currentIndex ) {
         randomIndex = Math.floor( Math.random() * currentIndex );
         currentIndex--;
         temporaryValue = db[currentIndex];
         db[currentIndex] = db[randomIndex];
         db[randomIndex] = temporaryValue;
      }
      return this;
   };

   this.iterate = function( callback ) {
      if ( _db.length === 0 ) {
         return false;
      }
      for ( var k = 0; k < _db.length; k++ ) {
         callback( _db[k][0], _db[k][1] );
      }
      return true;
   };
};

function testJsonHashMap() {
   var jsonObject = jsonStringToJsonObject( g_JsonStore );
   var a = new JsonHashMap( "string", "string", jsonObject );

   a.iterate( function( key, value ) { console.log( "a[" + key + "]=" + value ); } );
}
*/

function openDebugWin()
{
// var myDebugWindow = window.open();
// var myDebugWindow = window.open("","myDebugWindow","height=100,width=200");
   var myDebugWindow = window.open( "xyz", "_blank", "toolbar=yes, menubar=yes scrollbars=yes, resizable=yes, top=300, left=600, height=800, width=1000" );
   var myDocument = myDebugWindow.document;
   var HTMLstring="<html>\n" +
      "<head>\n<title>Zeidon View JSON</title>\n" +
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/json.css\">\n" +
      "<script src=\"http://code.jquery.com/jquery-1.10.2.min.js\"></script>\n" +
      "<script src=\"http://code.jquery.com/ui/1.10.3/jquery-ui.js\"></script>\n" +
      "<script src=\"js/jquery.blockUI.js\"></script>\n" +
      "<script src=\"js/jsoeUtils.js\"></script>\n" +
      "<script src=\"js/jsoe.js\"></script>\n" +
      "<script src=\"js/jsoeObjectBrowser.js\"></script>\n" +
      "<script>\n" +
         "$(document).ready( function() { // Once the page has loaded and is ready, the alert below will fire.\n" +
            "loadViewNames();\n" +
            "alert('Your page has loaded - and Now this alert appears!');\n" +
         "});\n" +
      "</script>\n" +
      "</head>\n" +
      "<body onload=\"loadViewNames()\">\n" +
      "<textarea id=\"RawJson\" style=\"display:none;\"></textarea>\n" +
             "<div id=\"ControlsRow\">\n" +
               "<input type=\"Button\" value=\"Format\" onClick=\"Process()\"/>\n" +
               "<span id=\"ViewNamesHolder\">View Names:\n" +
                 "<select id=\"ViewNames\" onChange=\"ViewNameChanged()\">\n" +
                 "</select>\n" +
               "</span>&nbsp;&nbsp;\n" +
               "<span id=\"TabSizeHolder\">Tab Size:\n" +
                 "<select id=\"TabSize\" onChange=\"TabSizeChanged()\">\n" +
                   "<option value=\"1\">1</option>\n" +
                   "<option value=\"2\">2</option>\n" +
                   "<option value=\"3\" selected=\"true\">3</option>\n" +
                   "<option value=\"4\">4</option>\n" +
                   "<option value=\"5\">5</option>\n" +
                   "<option value=\"6\">6</option>\n" +
                 "</select>\n" +
               "</span>&nbsp;&nbsp;\n" +
               "<span id=\"CollapsibleViewHolder\" >\n" +
                   "<label for=\"CollapsibleView\">\n" +
                     "<input type=\"checkbox\" id=\"CollapsibleView\" onClick=\"CollapsibleViewClicked()\" checked/>Collapsible View\n" +
                   "</label>\n" +
               "</span>&nbsp;&nbsp;\n" +
               "<span id=\"ViewMetaHolder\" >\n" +
                   "<label for=\"ViewMeta\">\n" +
                     "<input type=\"checkbox\" id=\"ViewMeta\" onClick=\"ViewMetaClicked()\"/>View Meta\n" +
                   "</label>\n" +
               "</span>&nbsp;&nbsp;\n" +
               "<span id=\"CollapsibleViewDetail\">Expand:\n" +
                 "<select id=\"CollapseLevel\" onChange=\"CollapseLevel()\">\n" +
                   "<option value=\"-1\">none</option>\n" +
                   "<option value=\"0\" selected=\"true\">all</option>\n" +
                   "<option value=\"1\">1</option>\n" +
                   "<option value=\"2\">2</option>\n" +
                   "<option value=\"3\">3</option>\n" +
                   "<option value=\"4\">4</option>\n" +
                   "<option value=\"5\">5</option>\n" +
                   "<option value=\"6\">6</option>\n" +
                   "<option value=\"7\">7</option>\n" +
                   "<option value=\"8\">8</option>\n" +
                   "<option value=\"9\">9</option>\n" +
                   "<option value=\"10\">10</option>\n" +
                   "<option value=\"11\">11</option>\n" +
                   "<option value=\"12\">12</option>\n" +
                   "<option value=\"12\">13</option>\n" +
                   "<option value=\"14\">14</option>\n" +
                   "<option value=\"15\">15</option>\n" +
                   "<option value=\"16\">16</option>\n" +
                 "</select>\n" +
               "</span>\n" +
             "</div>\n" +
             "<div id=\"zFormattedJsonLabel\" class=\"zFormattedJsonLabel\"></div>\n" +
             "<form id=\"InvisibleLink\" target=\"_blank\">\n" +
               "<input type=\"hidden\" id=\"InvisibleLinkUrl\" name=\"json\" value=\"\" />\n" +
             "</form>\n" +
             "</body></html>";
// console.log( HTMLstring );
   myDocument.write( HTMLstring );
//   myDebugWindow.document.getElementById("RawJson").value = g_JsonNewLabelA; // jsonStringToJsonObject( g_JsonNewLabel );
//   var rawJson = myDocument.getElementById("RawJson")
//   rawJason.outerHTML = jsonStringToJsonObject( g_JsonNewLabel );
   myDocument.close();
/*   myDebugWindow.onload = function() {
      alert( "On Load" );
   }; */
   return myDebugWindow;
}

function getSortOrderArray( tableId ) {
   var elTable = document.getElementById( tableId );
   var arrRowOrderIdx = new Array( elTable.rows.length - 1 );
   for ( var row = 0; row < arrRowOrderIdx.length; row++ ) {
      arrRowOrderIdx[row] = elTable.rows[row + 1].cells[0].innerText;
   }
   return arrRowOrderIdx;
}

function getSortOrder( tableId ) {
   var elView = document.getElementById( "zView" );
   var viewName = elView.value;
   var elEntity = document.getElementById( "zEntity" );
   var entityName = elEntity.value;
   var elNextJsp = document.getElementById( "zNextJsp" );
   var nextJsp = elNextJsp.value;
   var arrRowOrderIdx = getSortOrderArray( tableId );

   var url = "sortorder?taskID=" + window.TaskId + "&action=reorder&viewName=" + viewName + "&entityName=" + entityName + "&nextJsp=" + nextJsp;
   $.ajax({ url: url,
            type: "post", // string defining the HTTP method to use for the request: GET (default) or POST
            contentType: "application/json; charset=utf-8",
            dataType: "json", // defines the type of data expected back from the server (xml, html, json, or script)
            processData: true, // boolean (default:true) indicating whether to convert the submitted data from an object form into a query-string form
            data: "{\"array\":[" + arrRowOrderIdx + "]}",
         // beforeSend - callback function that is executed before the request is sent
            success: function( data, textStatus, jqXHR ) {
                        console.log( "reorder: success status: " + textStatus + "  data: " + data + "  jqXHR: " + jqXHR );
                     // document.wSystemListPrimaryRegistrants.zAction.value = "AdminDeletePrimaryRegistrant";
                     // document.wSystemListPrimaryRegistrants.submit( ); somewhere???
                        var jsonObj = jsonStringToJsonObject( data );
                        var nextJsp = jsonObj[0]["nextJsp"];
                     // alert( "Next JSP: " + nextJsp );
                     // window.location.replace( "/" + nextJsp );
                     // window.navigate( nextJsp );
                     // window.location.assign( "/" + nextJsp );
                     // window.location.reload();
                     // window.parent.location = window.parent.location.href;
                        ReturnToJsp();
                     },
            error:   function( jqXHR, textStatus, errorThrown ) {
                        console.log( "reorder: error xhr response: " + jqXHR.responseText + "  status: " + textStatus + "  error: " + errorThrown );
                     },
            complete: function( jqXHR, textStatus ) { // callback function that executes whenever the request finishes
                        console.log( "reorder: complete status: " + textStatus + "  response: " + jqXHR.responseText );
                     }
   });
   
   return arrRowOrderIdx;
}

function buildSortTableHtml( viewName, entityName, arrColumnTitles, tableId )
{
   var k, col, row;
   var strOdd;
   var table = "<table style=\"margin:100;padding-left:0;border-left:0\" id=\"DraggableSortTable\">\n" +
               "<thead><tr>\n<th>Order</th>\n";
   for ( k = 0; k < arrColumnTitles.length; k++ ) {
      table += "<th>" + arrColumnTitles[k] + "</th>\n";
   }
   table += "</tr></thead><tbody>";

   var elTable = document.getElementById( tableId );
   var txt;
   var arrColIdx = new Array( arrColumnTitles.length );
   for ( col = 0; col < elTable.rows[0].cells.length; col++ ) {
      txt = elTable.rows[0].cells[col].innerText;
      for ( k = 0; k < arrColumnTitles.length; k++ ) {
         if ( txt === arrColumnTitles[k] ) {
            arrColIdx[k] = col;
            break; // inside only
         }
      }
   }
   // we have the columns we are displaying in arrColIdx

   // now build the table data
   for ( row = 1; row < elTable.rows.length; row++ ) {
      strOdd = (row % 2) !== 0 ? " class='odd'" : "";
      table += "<tr" + strOdd + ">\n";
      table += "<td class=\"index\" nowrap><a href=\"#\" id=\"Order::" + row + "\">" + row + "</a></td>\n";
      for ( col = 0; col < arrColIdx.length; col++ ) {
         table += "<td nowrap><a href=\"#\" id=\"" + arrColumnTitles[col] + "::" + row + "\">" + elTable.rows[row].cells[arrColIdx[col]].innerText + "</a></td>\n";
      }
      table += "</tr>\n";
   }
   table += "</tbody>\n</table>\n" +
      "<input name=\"zView\" id=\"zView\" type=\"hidden\" value=\"" + viewName + "\">\n" +
      "<input name=\"zEntity\" id=\"zEntity\" type=\"hidden\" value=\"" + entityName + "\">\n" +
      "<input name=\"zOrderArray\" id=\"zOrderArray\" type=\"hidden\" value=\"NOVALUE\">\n";

   return table;
/* var HTMLstring = "<div>" + table + "</div>";
   console.log( HTMLstring );
   return HTMLstring;
*/
}

function buildSortWindow( taskId, viewName, entityName, nextJsp, title, arrColumnTitles, tableId )
{
// var mySortWindow = window.open();
// var mySortWindow = window.open("","mySortWindow","height=100,width=200");
   var mySortWindow = window.open( "xyz", "_self", "toolbar=yes, menubar=yes scrollbars=yes, resizable=yes, top=300, left=600, height=800, width=1000" );
   if ( title === "" ) {
      title = "Drag Sort";
   }
   var table = buildSortTableHtml( viewName, entityName, arrColumnTitles, tableId );
   var HTMLstring =
   "<html>\n" +
      "<head>\n<title>" + title + "</title>\n" +
      "<link href=\"./css/zeidon_allrelative.css\" rel=\"stylesheet\" type=\"text/css\">\n" +
      "<link href=\"./css/zeidon.css\" rel=\"stylesheet\" type=\"text/css\">\n" +
      "<link href=\"./css/main.css\" rel=\"stylesheet\" type=\"text/css\">\n" +
      "<script language=\"JavaScript\" type=\"text/javascript\" src=\"./js/common.js\"></script>\n" +
      "<script language=\"JavaScript\" type=\"text/javascript\" src=\"./js/css.js\"></script>\n" +
      "<script language=\"JavaScript\" type=\"text/javascript\" src=\"./js/validations.js\"></script>\n" +
      "<script language=\"JavaScript\" type=\"text/javascript\" src=\"./js/scw.js\"></script>\n" +
      "<script language=\"JavaScript\" type=\"text/javascript\" src=\"./js/animatedcollapse.js\"></script>\n" +
      "<script language=\"JavaScript\" type=\"text/javascript\" src=\"./js/md5.js\"></script>\n" +

      "<style>\n" +
      "body {  // <link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\n" +
      "   font-size: 62.5%;\n" +
      "   font-family: \"Trebuchet MS\", \"Arial\", \"Helvetica\", \"Verdana\", \"sans-serif\";\n" +
      "}\n" +
      "//#DraggableSortTable { list-style-type: none; margin: 0; padding: 0; width: 60%; }\n" +
      "//#DraggableSortTable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }\n" +
      "//#DraggableSortTable li span { position: absolute; margin-left: -1.3em; }\n" +
      "<script src=\"http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css\"></script>\n" +
      "</style>\n" +
      "<script src=\"http://code.jquery.com/jquery-1.10.2.min.js\"></script>\n" +
      "<script src=\"http://code.jquery.com/ui/1.11.0/jquery-ui.js\"></script>\n" +
      "<script src=\"js/jquery.blockUI.js\"></script>\n" +
      "<script src=\"js/jsoeUtils.js\"></script>\n" +
      "<script src=\"js/jsoe.js\"></script>\n" +
      "<script>\n" +
         "window.TaskId = " + taskId + ";\n" +
         "function loadSortableList() {\n" +
         // "alert('loadSortableList has fired!');\n" +
         "}\n" +
         "function SaveOrder() {\n" +
            "var arrRowOrderIdx = getSortOrder( \"DraggableSortTable\" );\n" +
         // "alert( 'Save Order: ' + arrRowOrderIdx.toString() );\n" +
         "};\n" +
         "function CancelOrder() {\n" +
         // "alert( 'Cancel Order' );\n" +
            "open( location, '_self' ).close();\n" +
         "}\n" +
         "function ReturnToJsp() {\n" +
         // "alert( 'ReturnToJsp' );\n" +
            "var sortWindow = document.getElementById( \"zSortWindow\" ).value;\n" +
            "var sortWindow2 = window.sortWindow;\n" +
            "alert( \"Sort Window: \" + sortWindow );\n" +
            "alert( \"Sort Window2: \" + sortWindow2 );\n" +
         // "var x = document.getElementsByTagName(\"form\");\n" +
         // "alert( \"Form Id: \" + x[0].id );\n" +
            "document.InvisibleLink.zAction.value = \"SystemListPrimaryRegistrants\";\n" +
            "document.InvisibleLink.submit();\n" +
            "open( location, '_self' ).close();\n" +
         // "sortWindow.close();\n" +
         "}\n" +
      "</script>\n" +
      "<script>\n" +
         "$(document).ready( function() { // Once the page has loaded and is ready, the alert below will fire.\n" +
            "loadSortableList();\n" +
         // "alert('Your page has loaded - and Now this alert appears!');\n" +
         "});\n" +

      "</script>\n" +
      "<script>\n" +

         "$(function() {\n" +
            "$( \"#DraggableSortTable\" ).sortable();\n" +
            "$( \"#DraggableSortTable\" ).disableSelection();\n" +

            "var fixCloneColumnWidths = function(e, tr) { // when dragging the row, maintains widths of columns within clone\n" +
               "var $originals = tr.children();\n" +
               "var $helper = tr.clone();\n" +
               "$helper.children().each(function(index) {\n" +
                  "$(this).width($originals.eq(index).width());\n" +
               "});\n" +
               "return $helper;\n" +
            "},\n" +
            "updateOddEven = function(e, ui) { // reset the odd/even row class\n" +
               "$('td.index', ui.item.parent()).each(function (k) {\n" +
                  "// $(this).html(k + 1);\n" + // uncomment to have row index change to new order
                  "if ( k % 2 ) {\n" +
                     "// console.log( \"adding class odd at: \" + k );\n" +
                     "$(this).closest(\"tr\").addClass( \"odd\" );\n" +
                  "} else {\n" +
                     "// console.log( \"removing class odd at: \" + k );\n" +
                     "$(this).closest(\"tr\").removeClass( \"odd\" );\n" +
                  "}\n" +
               "});\n" +
            "};\n" +

            "$(\"#DraggableSortTable tbody\").sortable({\n" +
               "helper: fixCloneColumnWidths,\n" +
               "stop: updateOddEven\n" +
            "}).disableSelection();    \n" +

         "});\n" +
      "</script>\n" +
      "</head>\n" +
      "<body onload=\"loadSortableList()\">\n" +
         "<div id=\"water\"></div>\n" +
         "<div id=\"maincontent\" style=\"margin-left:200;padding-left:0;border-left:0\">\n" +
         "<div id=\"contentnosidemenu\">\n" +

         "<textarea id=\"SortableList\" style=\"display:none;\"></textarea>\n" +

         "<!-- This is added as a line spacer -->\n" +
         "<div style=\"height:12px;width:100px;\"></div>\n" +
         "<div>  <!-- Beginning of a new line -->\n" +
         "</div>  <!-- End of a new line -->\n" +
         "<div style=\"clear:both;\"></div>  <!-- Moving to a new line, so do a clear -->\n" +
         "<div id=\"ControlsRow\" style=\"margin-left:100;padding-left:0;border-left:0\">\n" +
            "<span>\n" +
               "<button type=\"button\" class=\"newbutton\" value=\"Save Order\" onClick=\"SaveOrder()\" style=\"float:left;width:78px;height:20px;\">Save Order</button>\n" +
               "<button type=\"button\" class=\"newbutton\" value=\"Cancel\" onClick=\"CancelOrder()\" style=\"float:left;margin-left:20;width:78px;height:20px;\">Cancel</button>\n" +
            "</span>\n" +
         "</div>&nbsp;&nbsp;&nbsp;&nbsp;\n" +
         "<!-- This is added as a line spacer -->\n" +
         "<div style=\"height:20px;width:100px;\"></div>\n" +
         "<div>  <!-- Beginning of a new line -->\n" +
         "</div>  <!-- End of a new line -->\n" +
         "<div style=\"clear:both;\"></div>  <!-- Moving to a new line, so do a clear -->\n" +

         "<div id=\"zDontKnowWhyThisIsHere\" class=\"zDontKnowWhyThisIsHere\"></div>\n" +
         "<form id=\"InvisibleLink\" name=\"InvisibleLink\" target=\"_blank\">\n" +
            table +
         "<input name=\"zSortWindow\" id=\"zSortWindow\" type=\"hidden\" value=\"" + mySortWindow + "\">\n" +
         "<input name=\"zAction\" id=\"zAction\" type=\"hidden\" value=\"NOVALUE\">\n" +
         "<input name=\"zNextJsp\" id=\"zNextJsp\" type=\"hidden\" value=\"" + nextJsp + "\">\n" +
         "</form>\n" +
         "</div>   <!-- This is the end tag for the div 'contentnosidemenu' -->\n" +
         "</div>   <!-- This is the end tag for the div 'maincontent' -->\n" +
      "</body>\n" +
   "</html>";
   console.log( "Generated HTML: " + HTMLstring );

   var myDocument = mySortWindow.document;
   myDocument.write( HTMLstring );
// mySortWindow.document.getElementById("RawJson").value = g_JsonNewLabelA; // jsonStringToJsonObject( g_JsonNewLabel );
// var rawJson = myDocument.getElementById("RawJson")
// rawJason.outerHTML = jsonStringToJsonObject( g_JsonNewLabel );
   myDocument.close();
// mySortWindow.onload = function() {
//   alert( "On Load" );
// };
   return mySortWindow;
}

// buildSortHtml( "List Primary Registrants",  [ "Name", "Login", "Description" ], "GEPrimaryRegistrant" );
/*
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Create an account": function() {
           // addUser
        },
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
*/
function testJsonPath() {
   var jsonObject = jsonStringToJsonObject( g_JsonStore );
   var arg1 = "$..author";
   var arg2 = {resultType:"PATH"};
   var res1 = jsonPath( jsonObject, arg1 );
   var res2 = jsonPath( jsonObject, arg1, arg2 );
   var x1 = res1.toString();
   var x2 = res2.toString();
   console.log( "res1: " + res1 );
   console.log( "res2: " + res2 );
}

function displayElementData( message, $element ) {
   if ( $element ) {
      console.log( message + "... Element Data for: " + $element.attr( "id" ) );
      if ( $element.data() ) {
         $.each( $element.data(), function( key, value ) {
            if ( typeof value === "string" || typeof value === "number" ) {
               console.log( "   ~ " + key + " : " + value );
            }
         });
      }
   }
}

function zeidonAttributeToKey( attribute ) {
   var ch;
   var k;
   var key = "z_";
   for ( k = 0; k < attribute.length; k++ ) {
      ch = attribute.charAt( k );
      if ( ch === ch.toLowerCase() ) {
         key += ch;
      }
      else {
         key += "^";
         key += ch.toLowerCase();
      }
   }
   return key;
}

function addZeidonAttributeToElement( $element, attribute, value ) {
   if ( typeof value === "string" || typeof value === "number" ) {
      var key = zeidonAttributeToKey( attribute );
      console.log( "addZeidonAttributeToElement: " + $element.attr( "id" ) + "  key: " + key + "  value: " + value );
      $element.data( key, value );
   }
}

function mapUiDataToElementData( $current_element ) {
   if ( $current_element ) {
   // displayElementData( "mapUiDataToElementData (before)", $current_element );
      var entityAttr;
      var n;
      var entity;
      var key;
      var element_id = $current_element.attr( "id" );
      if ( element_id !== "label" && element_id !== "page" ) {
         element_id = "block";
      }
      $("input.zeidon, select.zeidon").each( function() {
         entityAttr = $(this).data( "zmap" );
         if ( entityAttr ) {
            n = entityAttr.indexOf( ".z_" );
            entity = entityAttr.substring( 0, n );
            key = entityAttr.substring( n + 1 );
            if ( entity === element_id ) {
               $current_element.data( key, this.type === "checkbox" ? (this.checked === true ? "Y" : "") : $(this).val() );
            }
         }
      });
   // displayElementData( "mapUiDataToElementData (after)", $current_element );
   }
}

function mapElementDataToUiData( $current_element ) {
   if ( $current_element ) {
   // displayElementData( "mapElementDataToUiData", $current_element );
      var entityAttr;
      var n;
      var entity;
      var key;
      var value;
      var element_id = $current_element.attr( "id" );
      if ( element_id !== "label" && element_id !== "page" ) {
         element_id = "block";
      }
      $("input.zeidon, select.zeidon").each( function() {
         entityAttr = $(this).data( "zmap" );
         if ( entityAttr ) {
            n = entityAttr.indexOf( ".z_" );
            entity = entityAttr.substring( 0, n );
            key = entityAttr.substring( n + 1 );
            if ( entity === element_id ) {
               value = $current_element.data( key );
               if ( ! value ) {
                  value = "";
               }
               if ( $(this).hasClass( "colorwell" ) ) {
                  if ( value.indexOf( '#' ) !== 0 ) {
                     value = "#ffffff";
                  }
                  var colorPicker = $.farbtastic( "#" + $(this).attr( "id" ) );
                  colorPicker.setColor( value );
               }
               this.type === "checkbox" ? (value === "Y" ? this.checked = true : this.checked = false) : $(this).val( value );
            }
         }
      });
   } else {
      $("input.zeidon, select.zeidon").each( function() {
         this.type === "checkbox" ? this.checked = false : $(this).val( "" );
      });
   }
}

$("input.zeidon, select.zeidon")
   .blur( function () {
      console.log( "updated zeidon block attributes" );
   // var jsonObj = null;
      var entityAttr = $(this).data( "zmap" );
      if ( entityAttr ) {
         var n = entityAttr.indexOf( ".z_" );
         var entity = entityAttr.substring( 0, n );
         var key = entityAttr.substring( n + 1 );
         var value = $(this).is( ":checkbox" ) ? $(this)[0].checked ? "Y" : "N" : $(this).val();
         if ( entity === "block" ) {
            if ( g_$current_block ) {
               g_updatedLLD = true;
               console.log( "updated block attribute: " + key + "  value: " + value );
               g_$current_block.data( key, value );
            }
         // jsonObj = dataToJSON( $current_block );
         } else if ( entity === "page" ) {
            g_updatedLLD = true;
            console.log( "updated page attribute: " + key + "  value: " + value );
            $("#page").data( key, value );
         // jsonObj = dataToJSON( $("#page") );
         } else if ( entity === "label" ) {
            g_updatedLLD = true;
            console.log( "updated label attribute: " + key + "  value: " + value );
            $("#label").data( key, value );
         }
         /*
         var jsonOut = "jsonOut: \n";
         jQuery.each( jsonObj, function(i, val) {
            jsonOut += "  ==> " + i + " - " + val + "\n";
         });
         alert( "jsonOut: " + jsonOut );
         */
      }
   });
