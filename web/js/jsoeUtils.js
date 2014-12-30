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
