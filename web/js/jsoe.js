"use strict";
/*
function getLastEntity( jsonObj ) {
var fruitObject = { "a" : "apple", "b" : "banana", "c" : "carrot" };
Object.keys(fruitObject); // this returns all properties in an array ["a", "b", "c"]
fruitObject[Object.keys(fruitObject)[Object.keys(fruitObject).length - 1]] // "carrot"
*/

/*
   function addZeidonAttributeToElement( $element, attribute, value ) {
      if (typeof value === "string" || typeof value === "number" ) {
         var key = zeidonAttributeToKey( attribute );
         console.log( "addZeidonAttributeToElement: " + $element.attr( "id" ) + "  key: " + key + "  value: " + value );
         $element.data( key, value );
      }
   }           for ( var prop in obj ) {
               if ( typeof obj[prop] === "string" ) {
               // if ( prop === "Tag" || prop === "Top" || prop === "Left" || prop === "Height" || prop === "Width" || prop === "Order" ) {
               //    continue;
               // } else {
                     addZeidonAttributeToElement( $element, prop, obj[prop] );
               // }
               }
            }
*/

/*
var setParentOrig = function( o ) {
   if ( typeof o === "object" ) {
      for ( var n in o ) {
         if ( typeof n === "object" ) {
            setParentOrig( n );
            n["..parentO"] = o;
         }
      }
   }
}
*/

// Note: use session storage when you need to store something that changes or something temporary.

// called with every property and its value
function logKeyValue( key, value, indent ) {
   var tab = buildTab( indent, true );
   console.log( tab + key + " : " + value );
}

function logJsonObject( jsonObject, callback, indent, showAll ) {
   for ( var prop in jsonObject ) {
      if ( jsonObject[prop] !== null && typeof( jsonObject[prop] ) === "object" ) {
         if ( prop.charAt( 0 ) !== "." || (showAll === true && prop.charAt( 1 ) !== ".") ) {
            var tab = buildTab( indent, true );
         // console.log( "Object: " + jsonObject[key].toString() );
            if ( $.isArray( jsonObject[prop] ) ) {
               console.log( tab + "Array: " + prop + "  length: " + jsonObject[prop].length );
            } else {
               console.log( tab + "Object: " + prop );
            }
            // going one step down in the object tree!!
            logJsonObject( jsonObject[prop], callback, indent + 1, showAll );
         }
      } else {
      // console.log( key + " : " + jsonObject[key] );
         callback.apply( this, [prop, jsonObject[prop], indent] );
      }
   }
}

function logZeidonJsonObject( jsonObject, entity, showAll ) {
   var typeObj = typeof jsonObject;
   if ( typeObj === "object" ) {
      if ( $.isArray( jsonObject ) ) {
      // console.log( "Array: " + jsonObject.length );
         if ( entity !== null && typeof( jsonObject[0] ) === "object" ) {
            for ( var k = 0; k < jsonObject.length; k++ ) {
               console.log( "logZeidonObject Showing Absolute Position: " + jsonObject[k][".hierNbr"] + "  Entity: " + entity + "  Tag: " + jsonObject[k]["Tag"] + "   Cursor: " + k );
               logZeidonJsonObject( jsonObject[k], null );
            }
         } else {
            console.log( "logZeidonObject Unknown Array object: " + typeof( jsonObject[0] ) + "  Object: " + jsonObject[0] );
            for ( var k = 0; k < jsonObject.length; k++ ) {
               logZeidonJsonObject( jsonObject[k], null, showAll );
            }
         }
      } else {
         var typeProp;
      // for ( var prop in jsonObject ) {
      //    console.log( "logZeidonObject prop: " + prop + " type: " + typeof( prop ) + "  type objprop: " + typeof( jsonObject[prop] ) );
      // }
         for ( var prop in jsonObject ) {
            typeProp = typeof jsonObject[prop];
            if ( typeProp === "object" ) {
            // console.log( "logZeidonObject Object: " + prop );
               if ( prop.charAt( 0 ) !== "." || (showAll === true && prop.charAt( 1 ) !== ".") ) {
               // console.log( "logZeidonObject Entity: " + prop + "   Absolute Position ==> " + jsonObject[prop][0][".hierNbr"] );
                  logZeidonJsonObject( jsonObject[prop], prop, showAll );
               }
            } else if ( typeProp === "string" || typeProp === "number" || typeProp === "function" || typeProp === "undefined" ) {
            // console.log( "logZeidonObject " + typeProp + " key : value ==> " + prop + " : " + jsonObject[prop] );
            } else if ( typeProp === "boolean" ) {
            // console.log( "logZeidonObject boolean key : value ==> " + prop + " : " + entityObj[prop] ? "true" : "false" );
            } else {
               console.log( "logZeidonObject Unknown: " + typeProp + "  Object: " + jsonObject );
            }
         }
      }
   } else {
      console.log( "logZeidonObject Unexpected: " + jsonObject );
   }
}

function initCursorsDeprecated( jsonObject, entity, cursors, parentObj, hierNbr ) {
   if ( typeof jsonObject === "object" ) {
      if ( $.isArray( jsonObject ) ) {
      // console.log( "initCursorsDeprecated Array: " + jsonObject.length );
         if ( entity !== null && typeof( jsonObject[0] ) === "object" ) {
            if ( cursors.getItem( entity ) === null ) {
               cursors.add( entity, jsonObject[0] );
            }
            for ( var k = 0; k < jsonObject.length; k++ ) {
               hierNbr++;
            //xconsole.log( "initCursorsDeprecated Setting Absolute Position: " + jsonObject[k] + "  Entity: " + jsonObject[k]["Tag"] + "   Absolute Position: " + hierNbr );
               jsonObject[k][".hierNbr"] = hierNbr;
               hierNbr = initCursorsDeprecated( jsonObject[k], null, cursors, jsonObject, hierNbr );
            //yjsonObject[k]["..parentA"] = jsonObject;
            //yjsonObject[k]["..parentO"] = parentObj;
            //yjsonObject[k][".entity"] = entity;
            }
         } else {
            console.log( "initCursorsDeprecated Unknown Array object: " + typeof( jsonObject[0] ) + "  Object: " + jsonObject[0] );
            for ( var k = 0; k < jsonObject.length; k++ ) {
               hierNbr = initCursorsDeprecated( jsonObject[k], null, cursors, parentObj, hierNbr );
            }
         }
      } else { // it's not an array
         var typeProp;
         for ( var prop in jsonObject ) {
            typeProp = typeof jsonObject[prop];
            if ( typeProp === "object" ) {
            // console.log( "initCursorsDeprecated Object: " + prop );
               if ( prop.charAt( 0 ) !== "." && prop !== "OIs" ) {  // ..parentA ..parentO .meta .oimeta and OIs
                  if ( $.isArray( jsonObject[prop] ) && typeof( jsonObject[prop][0] ) === "object" ) {
                     hierNbr = initCursorsDeprecated( jsonObject[prop], prop, cursors, parentObj, hierNbr );
                  } else {
                     console.log( "initCursorsDeprecated Unknown Subobject: " + typeProp + "  Object: " + jsonObject );
                  }
               }
            } else if ( typeProp === "string" || typeProp === "number" || typeProp === "function" || typeProp === "undefined" ) {
            // console.log( "initCursorsDeprecated " + typeProp + " key : value ==> " + prop + " : " + jsonObject[prop] );
            } else if ( typeProp === "boolean" ) {
            // console.log( "initCursorsDeprecated boolean key : value ==> " + prop + " : " + jsonObject[prop] ? "Y" : "N" );
            } else {
               console.log( "initCursorsDeprecated Unknown: " + typeProp + "  Object: " + jsonObject );
            }
         }
      }
   } else {
      console.log( "initCursorsDeprecated Unexpected: " + jsonObject );
   }
   return hierNbr;
}

function setHierarchicalJsonObject( jsonObject, rootEntity, cursors ) {
   var obj;
   var returnObj;
   var typeProp;
   if ( typeof jsonObject === "object" ) {
      for ( var prop in jsonObject ) {
         typeProp = typeof prop;
         if ( typeProp === "string" ) {
            if ( prop === "OIs" ) {
               obj = jsonObject[prop];
               if ( $.isArray( obj ) ) {
                  for ( var k = 0; k < obj.length; k++ ) {
                     if ( typeof obj[k] === "object" ) {
                        var containerObj = obj[k];
                        for ( prop in containerObj ) {
                           if ( typeof prop === "string" && prop === rootEntity ) {
                              var entityCursor = cursors.getItem( "_" );
                              if ( entityCursor === null ) {
                                 entityCursor = new ZeidonEntityCursor( rootEntity, null, null, null );
                              }
                              entityCursor.setEI( obj, k );
                              cursors.add( "_", entityCursor );
                              setHierarchicalJsonObjectRecurse( containerObj, null, cursors, null, 0 );
                              return containerObj;
                           }
                        }
                     }
                  }
               }
            } else if ( prop.charAt( 0 ) !== "." ) {
               returnObj = setHierarchicalJsonObject( jsonObject[prop], rootEntity, cursors );
               if ( returnObj ) {
                  return returnObj;
               }
            }
         } else if ( typeProp === "object" ) {
            if ( prop.charAt( 0 ) !== "." ) {
               obj = jsonObject[prop];
               if ( obj !== null ) {
                  typeObj = typeof obj;
                  if ( typeObj === "object" ) {
                     returnObj = setHierarchicalJsonObject( jsonObject[prop], rootEntity, cursors );
                     if ( returnObj ) {
                        return returnObj;
                     }
                  }
               }
            }
         }
      }
   }
   return null;
}

function setHierarchicalJsonObjectRecurse( jsonObject, entity, cursors, parentObj, hierNbr ) {
   var obj;
   var typeObj;
   if ( typeof jsonObject === "object" ) {
      for ( var prop in jsonObject ) {
         obj = jsonObject[prop];
         if ( obj !== null ) {
            typeObj = typeof obj;
            if ( typeObj === "object" ) {
               if ( prop.charAt( 0 ) !== "." ) {  // ..parentA ..parentO .meta .oimeta
               //xconsole.log( "setHierarchicalJsonObjectRecurse Object: " + prop );
                  if ( $.isArray( obj ) ) {
                  //xconsole.log( "setHierarchicalJsonObjectRecurse Array: " + prop + "  length: " + obj.length );
                     if ( prop !== null && typeof( obj[0] ) === "object" ) {
                        var entityCursor;
                        entityCursor = cursors.getItem( prop );
                        if ( entityCursor && entityCursor.getEI() === null ) {
                           entityCursor.setEI( obj, obj.length > 0 ? 0 : -1 );
                        }
                        for ( var k = 0; k < obj.length; k++ ) {
                           hierNbr++;
                        //xconsole.log( "setHierarchicalJsonObjectRecurse Setting Absolute Position: " + obj[k]["Tag"] + "  Entity: " + prop + "   Absolute Position: " + hierNbr );
                           obj[k][".hierNbr"] = hierNbr;
                        //yobj[k]["..parentA"] = obj;
                        //yobj[k]["..parentO"] = parentObj;
                        //yobj[k][".entity"] = prop;
                           hierNbr = setHierarchicalJsonObjectRecurse( obj[k], null, cursors, obj[k], hierNbr );
                        // cursors.findParentEntity( prop );
                        }
                     } else {
                     //xconsole.log( "setHierarchicalJsonObjectRecurse Unknown Array object: " + typeof( obj[0] ) + "  Object: " + obj[0] );
                        for ( var k = 0; k < obj.length; k++ ) {
                           hierNbr = setHierarchicalJsonObjectRecurse( obj[k], null, cursors, obj, hierNbr );
                        }
                     }
                  } else {
                  //xconsole.log( "Object: " + prop );
                     if ( entity ) {
                        hierNbr++;
                        obj[".hierNbr"] = hierNbr;
                     //yobj["..parentO"] = parentObj;
                     }
                     // going one step down in the object tree!!
                     hierNbr = setHierarchicalJsonObjectRecurse( obj, null, cursors, obj, hierNbr );
                  }
               }
          /* } else {
               // func.apply( this, [prop, obj, 1] );
               if ( typeObj === "string" || typeObj === "number" || typeObj === "function" || typeObj === "undefined" ) {
               // console.log( "setHierarchicalJsonObjectRecurse " + typeProp + " key : value ==> " + prop + " : " + entityObj[prop] );
               } else if ( typeObj === "boolean" ) {
               // console.log( "setHierarchicalJsonObjectRecurse boolean key : value ==> " + prop + " : " + entityObj[prop] ? "true" : "false" );
               } else {
                  console.log( "setHierarchicalJsonObjectRecurse Unknown: " + typeObj + "  Object: " + jsonObject );
               } */
            }
         }
      }
   } else {
      console.log( "setHierarchicalJsonObjectRecurse Unexpected: " + jsonObject );
   }
   return hierNbr;
}

var ZeidonEntityCursor = function( entity, parentEntity, recursive, derived ) {
   var _entity;  // don't think we need entity ... remove for deployment!!!
   var _parentEntity; // parent entity name
   var _recursive; // this is a recursive entity
   var _derived; // useful on client side???
   var _array; // entity instance container
   var _cursor; // current cursor position (-1 ==> unset)
   var _flag; // used in processing this container's list
   var _outOfScope; // > 0 ==> not in scope
   var _resetEntityCursor; // not null ==> EntityCursor to set back to on resetSubobject
   var _level;

   (function() {
   //xconsole.log( "Adding ZeidonEntityCursor: " + entity + "  Parent: " + parentEntity + "  Recursive:" + recursive + "  Derived:" + derived );
      _entity = entity;
      _parentEntity = parentEntity;
      _recursive = recursive === "Y" ? true : false;
      _derived = derived === "Y" ? true : false;
      _array = null;
      _cursor = -1;
      _outOfScope = 0;
      _resetEntityCursor = null;
      _level = 0;
   })();

   this.copy = function() {
      var entityCursor = new ZeidonEntityCursor( this.getEntity(), this.getParentEntity(), this.getRecursive(), this.getDerived() );
      entityCursor.setArray( this.getArray() );
      entityCursor.setCursor( this.getCursor() );
      entityCursor.setFlag( this.getFlag() );
   // console.log( "Copying outOfScope (" + this.getOutOfScope() + ") for entity: " + this.getEntity() );
      entityCursor.setOutOfScope( this.getOutOfScope() );
      entityCursor.setLevel( this.getLevel() + 1 );
      this.setResetEntityCursor( entityCursor ); // point the original to the new
      return entityCursor;
   };

   this.reset = function() {
      var entityCursor = this.getResetEntityCursor();
      if ( entityCursor ) {
      /* console.log( "reset entity: " + this.getEntity() + " from: " + entityCursor.getEntity() );
         console.log( "reset parent entity: " + this.getParentEntity() + " from: " + entityCursor.getParentEntity() );
         console.log( "reset recursive: " + this.getRecursive() + " from: " + entityCursor.getRecursive() );
         console.log( "reset derived: " + this.getDerived() + " from: " + entityCursor.getDerived() );
         console.log( "reset array: " + this.getArray() + " from: " + entityCursor.getArray() );
         console.log( "reset cursor: " + this.getCursor() + " from: " + entityCursor.getCursor() );
         console.log( "reset flag: " + this.getFlag() + " from: " + entityCursor.getFlag() );
         console.log( "reset OutOfScope: " + this.getOutOfScope() + " from: " + entityCursor.getOutOfScope() );
         console.log( "reset level: " + this.getLevel() + " from: " + entityCursor.getLevel() );
         console.log( "reset ResetEntityCursor: " + this.getResetEntityCursor() + " from: " + entityCursor.getResetEntityCursor() ); */
         this.setEntity( entityCursor.getEntity() );
         this.setParentEntity( entityCursor.getParentEntity() );
         this.setRecursive( entityCursor.getRecursive() );
         this.setDerived( entityCursor.getDerived() );
         this.setArray( entityCursor.getArray() );
         this.setCursor( entityCursor.getCursor() );
         this.setFlag( entityCursor.getFlag() );
         this.setOutOfScope( entityCursor.getOutOfScope() );
         this.setResetEntityCursor( entityCursor.getResetEntityCursor() );
      }
   };

   this.setEI = function( array, cursor ) {
      if ( array && $.isArray( array ) === false ) {
         throw new Error( "setEI: Object must be an array for entity: " + _entity );
      }
      _array = array;
      _cursor = cursor;
      return this;
   };

   this.getEI = function() {
      if ( _array && _cursor >= 0 && _outOfScope === 0 ) {
         var ei = _array[_cursor];
         if ( ei[".deleted"] !== true ) {
            return _array[_cursor];
         }
      }
      return null;
   };

   this.setArray = function( array ) {
      _array = array;
   };

   this.getArray = function() {
      return _array;
   };

   this.setCursor = function( cursor ) {
      _cursor = cursor;
   };

   this.getCursor = function() {
      return _cursor;
   };

   this.setParentEntity = function( parentEntity ) {
      _parentEntity = parentEntity;
   };

   this.getParentEntity = function() {
      return _parentEntity;
   };

   this.setRecursive = function( recursive ) {
      _recursive = recursive;
   };

   this.getRecursive = function() {
      return _recursive;
   };

   this.setDerived = function( derived ) {
      _derived = derived;
   };

   this.getDerived = function() {
      return _derived;
   };

   this.setEntity = function( entity ) {
      _entity = entity;
   };

   this.getEntity = function() {
      return _entity;
   };

   this.clear = function() {
      _array = null;
      _cursor = -1;
   };

   this.setResetEntityCursor = function( entityCursor ) {
      _resetEntityCursor = entityCursor;
   };

   this.getResetEntityCursor = function() {
      return _resetEntityCursor;
   };

   this.setReset = function( entityCursor ) {
      entityCursor.setResetEntityCursor( this );
   };

   this.setFlag = function( k ) {
      _flag = k;
   };

   this.getFlag = function() {
      return _flag;
   };

   this.setLevel = function( k ) {
      _level = k;
   };

   this.getLevel = function() {
      return _level;
   };

   this.incrementOutOfScope = function() {
      _outOfScope++;
   };

   this.decrementOutOfScope = function() {
      _outOfScope--;
   };

   this.setOutOfScope = function( outOfScope ) { // deprecated
      _outOfScope = outOfScope;
   };

   this.getOutOfScope = function() {
      return _outOfScope;
   };
};

// To copy an array efficiently:  var array_new = array.slice( 0 );
/*
Class - Defines the characteristics of the Object.
Object - An Instance of a Class.
Property - An Object characteristic, such as color.
Method - An Object capability, such as walk.
Constructor - A method called at the moment of instantiation.
Inheritance - A Class can inherit characteristics from another Class.
Encapsulation - A Class defines only the characteristics of the Object, a method defines only how the method executes.
Abstraction - The conjunction of complex inheritance, methods, properties of an Object must be able to simulate a reality model.
Polymorphism - Different Classes might define the same method or property.
*/

// ZeidonViewNames - subclass (of SimpleHashMap).
var ZeidonViewNames = function() {
   SimpleHashMap.call( this, "string", "object" ); // call super constructor
   return this;
};

// subclass extends superclass
ZeidonViewNames.prototype = Object.create(SimpleHashMap.prototype); // inherit from SimpleHashMap
ZeidonViewNames.prototype.constructor = ZeidonViewNames;

ZeidonViewNames.prototype.getViewByName = function( viewName ) {
   var viewCursors = this.getItem( viewName );
// console.log( "getViewByName for: " + viewName + "   returning: " + viewCursors );
   return viewCursors;
};

ZeidonViewNames.prototype.setNameForView = function( viewCursors, viewName ) {
   console.log( "setNameForView adding: " + viewName );
   this.addItem( viewName, viewCursors );
};

ZeidonViewNames.prototype.dropNameForView = function( viewCursors, viewName ) {
   console.log( "dropNameForView dropping: " + viewName );
   var vc = this.getItem( viewName );
   if ( vc && vc === viewCursors ) {  // the default equality operator in JavaScript for Objects yields true when they refer to the same location in memory
      this.removeItem( viewName );
      return vc;
   }
   return null;
};

// ZeidonViewCursors - subclass (of SimpleHashMap).
var ZeidonViewCursors = function() {
   this._root = null;
   SimpleHashMap.call( this, "string", "object" ); // call super constructor
   return this;
};

// subclass extends superclass
ZeidonViewCursors.prototype = Object.create(SimpleHashMap.prototype); // inherit from SimpleHashMap
ZeidonViewCursors.prototype.constructor = ZeidonViewCursors;

ZeidonViewCursors.prototype.getRoot = function() {
   return this._root;
};

ZeidonViewCursors.prototype.getEI = function( entity ) {
   var entityCursor = this.getItem( entity );
   if ( entityCursor ) {
      return entityCursor.getEI();
   }
   return null;
};

ZeidonViewCursors.prototype.getParentEntity = function( entity ) {
   var entityCursor = this.getItem( entity );
   if ( entityCursor ) {
      return entityCursor.getParentEntity();
   }
   return null;
};

ZeidonViewCursors.prototype.getParentEI = function( entity ) {
   var parentEntity = this.getParentEntity( entity );
   var parentEI = this.getEI( parentEntity );
   return parentEI;
};

ZeidonViewCursors.prototype.loadLod = function( lodObject, parentEntity ) {
   for ( var prop in lodObject ) {
      if ( lodObject[prop] !== null && typeof( lodObject[prop] ) === "object" ) {
         if ( prop.charAt( 0 ) !== "." ) {
            var entity = parentEntity;
            if ( $.isArray( lodObject[prop] ) ) {
            // console.log( "Array: " + prop + "  length: " + lodObject[prop].length );
               for ( var k = 0; k < lodObject[prop].length; k++ ) {
                  entity = lodObject[prop][k].Name;
                  if ( entity ) {
                     var entityCursor;
                  // console.log( "Found Entity: " + entity + "  Parent: " + parentEntity );
                     if ( prop === "Object"  ) {
                        entityCursor = new ZeidonEntityCursor( entity, null, null, null );
                        this.add( "_", entityCursor );
                     } else if ( prop === "Root" ) {
                        this._root = entity;
                        parentEntity = "_";
                     }
                     if ( this._root ) {
                        entityCursor = new ZeidonEntityCursor( entity, parentEntity, lodObject[prop][k].Recursive, lodObject[prop][k].Derived );
                        this.add( entity, entityCursor );
                     } else {
                        // this is the name of the LOD ... put it in a global hashmap
                        if ( ! g_LodMap.get( entity ) ) {
                           g_LodMap.add( entity, this ); // add this LOD to the global hashmap
                        }
                     }
                     // going one step down in the object tree!!
                  //xconsole.log( "Object0: " + prop );
                     this.loadLod( lodObject[prop][k], entity );
                  } else {
                     // going one step down in the object tree!!
                  //xconsole.log( "Object1: " + prop );
                     this.loadLod( lodObject[prop], parentEntity );
                  }
               }
            } else {
               // going one step down in the object tree!!
            //xconsole.log( "Object2: " + prop );
               this.loadLod( lodObject[prop], parentEntity );
            }
         }
      } else {
      // console.log( "Attribute ==> " + prop + " : " + lodObject[prop] );
      }
   }
};

ZeidonViewCursors.prototype.logLod = function( lodObject, parent ) {
   for ( var prop in lodObject ) {
      if ( lodObject[prop] !== null && typeof( lodObject[prop] ) === "object" ) {
         if ( prop.charAt( 0 ) !== "." ) {
            if ( $.isArray( lodObject[prop] ) ) {
               if ( prop === "Entity" || prop === "Root" ) {
                  for ( var k = 0; k < lodObject[prop].length; k++ ) {
                     var entity = lodObject[prop][k].Name;
                     var recursive = lodObject[prop][k].Recursive;
                     var derived = lodObject[prop][k].Derived;
                     var message = prop + ": " + entity + "  Parent: " + parent;
                     if ( recursive )
                        message += "  Recursive";
                     if ( derived )
                        message += "  Derived";
                     console.log( message );
                     // going one step down in the object tree!!
                     this.logLod( lodObject[prop][k], entity );  // we know this is mandatory
                  }
               } else {
                  if ( prop === "OIs" || prop === "Object" ) {
                     console.log( "Container: " + prop + "  length: " + lodObject[prop].length  );
                  } else {
                     console.log( "Array: " + prop + "  length: " + lodObject[prop].length );
                  }
                  // going one step down in the object tree!!
                  this.logLod( lodObject[prop], parent );
               }
            } else {
               // going one step down in the object tree!!
            // console.log( "Non-Array: " + prop );
               this.logLod( lodObject[prop], parent );
            }
         }
      }
   }
};

ZeidonViewCursors.prototype.resetEntityCursors = function() {
   this.iterate( function( key, value ) {
      if ( key !== "_" ) { // forget the top container ... not a real entity, but does hold the "container entity"
      //xconsole.log( "Reset cursors for: " + v.getEntity() );
         value.clear();
      }
   });
};

ZeidonViewCursors.prototype.toString = function() {
   var result;
   if ( this._db.length > 0 ) {
      result = "{ ";
      for ( var k = 0; k < this._db.length; k++ ) {
         result += "{ " + this._db[k][0] + " : " + this._db[k][1] + " }";
      }
      result += " }";
   } else {
      result = "{}";
   }
   return result;
};

ZeidonViewCursors.prototype.display = function( attribute ) {
   var ei;
   this.iterate( function( key, value ) {
      if ( key !== "_" ) { // forget the top container ... not a real entity
         ei = value.getEI();
         if ( ei ) {
            var msg = "Entity: " + key + "   Absolute Entity: " + ei[".hierNbr"] + "   Cursor: " + value.getCursor();
            if ( attribute && attribute !== "" ) {
               msg += "   " + attribute + ": " + ei[attribute];
            }
            console.log( msg );
         } else {
            console.log( "Entity: " + key + "   No Cursor" );
         }
      }
   });
};

ZeidonViewCursors.prototype.logHierarchy = function( entity, attribute ) {
   var entityCursor = this.getItem( entity );
   if ( entityCursor ) {
      var parentEntity = entityCursor.getParentEntity();
      if ( parentEntity ) {
         var indent;
         if ( parentEntity === "_" ) {
            indent = 0;
         } else {
            indent = this.logHierarchy( parentEntity, attribute );
         }
         var tab = buildTab( indent, true );
         var ei = entityCursor.getEI();
         console.log( tab + entity + "  " + attribute + ": " + (ei ? ei[attribute] : "n/a") );
         return indent + 1;
      }
   }
   return 0;
};

ZeidonViewCursors.prototype.findParentEntity = function( entity ) {
   var entityCursor = this.getItem( entity );
   if ( entityCursor ) {
      if ( entityCursor.getEntity() !== entity ) {
         if ( entity !== "_" ) {
            console.log( "findParentEntity encountered entity mismatch: " + entity + "   getEntity: " + entityCursor.getEntity() );
         }
         return null;
      }
      var parentEntity = entityCursor.getParentEntity();
      console.log( "findParentEntity of: " + entity + "  ==> " + parentEntity + "   Cursor: " + entityCursor.getCursor() );
      return parentEntity;
   }
   return null;
};

ZeidonViewCursors.prototype.searchForEntityByValue = function( entityObj, searchAttribute, searchValue, position, cursorIdx ) {
   var k;
   switch ( position ) {
      case 1: // POS_FIRST
         k = 0;
         break;
      case 2: // POS_LAST
         k = entityObj.length - 1;
         break;
      case 3: // POS_NEXT
         k = cursorIdx + 1;
         break;
      case 4: // POS_PREV
         k = cursorIdx - 1;
         break;
      default:
         k = cursorIdx;
         console.log( "Invalid position parameter: " + position );
   }
   if ( searchAttribute ) {
      if ( position === 1 || position === 3 ) { // POS_FIRST or POS_NEXT
         while ( k < entityObj.length ) {
            if ( entityObj[k][searchAttribute] === searchValue ) {
               break;
            }
            k++;
         }
      } else if ( position === 2 || position === 4 ) { // POS_LAST or POS_PREV
         while ( k >= 0 ) {
            if ( entityObj[k][searchAttribute] === searchValue ) {
               break;
            }
            k--;
         }
      }
   }
   if ( k < 0 || k >= entityObj.length ) {
      k = cursorIdx;
   }

   return k;
};

// If searchAttribute is not null, look for the first/last/next/prev instance of searchEntity with the attribute value specified by searchValue, otherwise,
// just look for the first/last/next/prev instance of searchEntity meeting the given criteria.
// If position is not POS_NONE, reset the cursors if the requested entity instance is located.  Respect parentage if scopingEntity is specified (i.e.  only
// entities hierarchically below the scoping entity can change position).
// Position may be one of five values: POS_FIRST = 1; POS_LAST = 2; POS_NEXT = 3; POS_PREV = 4 (POS_NONE = 0 is invalid) 
// Note that that "path" and "recurse" parameters are for testing purposes only and should be removed prior to deployment.
ZeidonViewCursors.prototype.locateEntity = function( entityObj, searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, entity, establishPosition, recurse, path ) {
// this.locateEntity = function( entityObj, searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, entity, establishPosition ) {
   var entityCursor;
   var cursorIdx;
   var rc = -4;
   if ( typeof entityObj === "object" ) {
   //xconsole.log( "locateEntity coming through path: " + path + "   recurse: " + recurse );
      if ( $.isArray( entityObj ) ) {
         var k;
      // console.log( "locateEntity Array: " + jsonObject.length );
         if ( entity !== null && typeof( entityObj[0] ) === "object" ) {
            entityCursor = this.getItem( entity );
            cursorIdx = entityCursor.getCursor();
            if ( entity === searchEntity ) { // we are at the correct entity
               k = this.searchForEntityByValue( entityObj, searchAttribute, searchValue, position, cursorIdx );
               if ( k >= 0 ) {
                  if ( establishPosition ) {
                     this.resetEntityCursors();
                  //xconsole.log( "locateEntity1 resetting EI for entity: " + entity + "  at cursor: " + k );
                     entityCursor.setEI( entityObj, k );
                     this.resetChildCursors( entityObj[k], entity );
                  //zthis.display();
                  }
                  if ( k === cursorIdx ) {
                     if ( position === 3 || position === 4 ) { // POS_NEXT or POS_PREV
                        return -1; // CURSOR_UNCHANGED
                     }
                  }
                  return 0; // CURSOR_SET
               } else {
                  return -2; // CURSOR_UNDEFINED
               }
            } else { // we are hierarchically above the entity we are looking for
               if ( belowScope === false ) { // can't move parentage at this level
                  if ( entity === scopingEntity ) {
                     belowScope = true;
                  }
                  rc = this.locateEntity( entityObj[cursorIdx], searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, null, establishPosition, recurse + 1, "A2" );
                  if ( rc > -4 ) {
                     if ( establishPosition ) {
                     //xconsole.log( "locateEntity2 resetting EI for entity: " + entity );
                        entityCursor.setEI( entityObj, cursorIdx );
                     // this.resetChildCursors( entityObj[cursorIdx], entity );
                     //zthis.display();
                     }
                     return rc;
                  }
               } else { // so parentage is permitted to change at this level
                  if ( position === 1 || position === 3 ) { // POS_FIRST or POS_NEXT
                     for ( k = (position === 1) ? 0 : cursorIdx; k < entityObj.length; k++ ) {
                        rc = this.locateEntity( entityObj[k], searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, null, establishPosition, recurse + 1, "A1" );
                        if ( rc > -4 ) {
                        //xconsole.log( "locateEntity3 resetting EI for entity: " + entity );
                           if ( establishPosition ) {
                              entityCursor.setEI( entityObj, k );
                           }
                        // this.resetChildCursors( entityObj[k], entity );
                        //zthis.display();
                           if ( position === 1 || k === cursorIdx ) {
                              return rc;
                           } else {
                              return -2; // CURSOR_SET_NEWPARENT
                           }
                        }
                     }
                  } else if ( position === 2 || position === 4 ) { // POS_LAST or POS_PREV
                     for ( k = (position === 2) ? entityObj.length - 1 : cursorIdx; k >= 0; k-- ) {
                        rc = this.locateEntity( entityObj[k], searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, null, establishPosition, recurse + 1, "A2" );
                        if ( rc > -4 ) {
                        //xconsole.log( "locateEntity4 resetting EI for entity: " + entity );
                           if ( establishPosition ) {
                              entityCursor.setEI( entityObj, k );
                           }
                        // this.resetChildCursors( entityObj[k], entity );
                           if ( position === 2 || k === cursorIdx ) {
                              return rc;
                           } else {
                              return -2; // CURSOR_SET_NEWPARENT
                           }
                        }
                     }
                  } else {
                     console.log( "Locating entity has an invalid position parameter: " + position );
                  }
               }
            }
         }
      } else { // it's not an array
         var typeProp;
         for ( var prop in entityObj ) {
            typeProp = typeof entityObj[prop];
            if ( typeProp === "object" ) {
            //xconsole.log( "locateEntity Object: " + prop );
               if ( prop.charAt( 0 ) !== "." && prop !== "OIs" ) {  // ..parentA ..parentO .meta .oimeta and OIs ... we should always be below OIs???
                  if ( $.isArray( entityObj[prop] ) && typeof( entityObj[prop][0] ) === "object" ) {
                     entityCursor = this.getItem( prop );
                     cursorIdx = entityCursor.getCursor();
                     rc = this.locateEntity( entityObj[prop], searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, prop, establishPosition, recurse + 1, "C" );
                     if ( rc > -4 ) {
                     //xconsole.log( "locateEntity1 NOT resetting EI for entity: " + prop );
                     //zthis.display();
                        return rc; // do not reset cursor position here
                     }
                  } else {
                     console.log( "locateEntity Unknown Subobject: " + typeProp + "  Object: " + entityObj + "   Path D" );
                  }
               }
         /* } else if ( typeProp === "string" || typeProp === "number" || typeProp === "function" || typeProp === "undefined" ) {
               console.log( "locateEntity " + typeProp + " key : value ==> " + prop + " : " + entityObj[prop] );
            } else if ( typeProp === "boolean" ) {
               console.log( "locateEntity boolean key : value ==> " + prop + " : " + entityObj[prop] ? "true" : "false" );
            } else {
               console.log( "locateEntity Unknown: " + typeProp + "  Object: " + entityObj ); */
            }
         }
      }
   } else {
      console.log( "locateEntity Unexpected: " + entityObj );
   }
   return rc;
};

ZeidonViewCursors.prototype.resetChildCursors = function( entityObj, entity ) {
   var typeProp;
   for ( var prop in entityObj ) {
      typeProp = typeof entityObj[prop];
      if ( typeProp === "object" ) {
         if ( prop.charAt( 0 ) !== "." && prop !== "OIs" ) {  // ..parentA ..parentO .meta .oimeta and OIs ... we should always be below OIs???
            if ( $.isArray( entityObj[prop] ) && typeof( entityObj[prop][0] ) === "object" ) {
               this.resetChildCursorsRecurse( entityObj[prop], prop );
            } else {
               console.log( "Unknown Subobject: " + typeProp + "  Object: " + entityObj + "   Path D" );
            }
         }
   /* } else if ( typeProp === "string" || typeProp === "number" || typeProp === "function" || typeProp === "undefined" ) {
         console.log( typeProp + " key : value ==> " + prop + " : " + entityObj[prop] );
      } else if ( typeProp === "boolean" ) {
         console.log( "boolean key : value ==> " + prop + " : " + entityObj[prop] ? "true" : "false" );
      } else {
         console.log( "Unknown: " + typeProp + "  Object: " + entityObj ); */
      }
   }
};

ZeidonViewCursors.prototype.resetChildCursorsRecurse = function( entityObj, entity ) {
   if ( typeof entityObj === "object" ) {
      if ( $.isArray( entityObj ) ) {
         if ( entity !== null && typeof( entityObj[0] ) === "object" ) {
            var eo = this.getItem( entity );
            if ( eo ) {
               if ( eo.getEI() === null ) {
                  eo.setEI( entityObj, 0 );
               //xconsole.log( "resetChildCursorsRecurse resetting entity: " + entity + "  hierNbr: " + entityObj[0]["..parentO"][".hierNbr"] );
                  this.resetChildCursorsRecurse( entityObj[0], null );
               }
            } else {
               console.log( "resetChildCursors could not establish cursor position for entity: " + entity );
            }
         } else {
            for ( var k = 0; k < entityObj.length; k++ ) {   // never get here!!!
               this.resetChildCursorsRecurse( entityObj[k], null );
            }
         }
      } else { // it's not an array
         var typeProp;
         for ( var prop in entityObj ) {
            typeProp = typeof entityObj[prop];
            if ( typeProp === "object" ) {
               if ( prop.charAt( 0 ) !== "." && prop !== "OIs" ) {  // ..parentA ..parentO .meta .oimeta and OIs
                  if ( $.isArray( entityObj[prop] ) && typeof( entityObj[prop][0] ) === "object" ) {
                     this.resetChildCursorsRecurse( entityObj[prop], prop );
                  } else {
                     console.log( "Unknown Subobject: " + typeProp + "  Object: " + entityObj + "   Path D" );
                  }
               }
         /* } else if ( typeProp === "string" || typeProp === "number" || typeProp === "function" || typeProp === "undefined" ) {
               console.log( typeProp + " key : value ==> " + prop + " : " + entityObj[prop] );
            } else if ( typeProp === "boolean" ) {
               console.log( "boolean key : value ==> " + prop + " : " + entityObj[prop] ? "true" : "false" );
            } else {
               console.log( "Unknown: " + typeProp + "  Object: " + entityObj ); */
            }
         }
      }
   } else {
      console.log( "Unexpected: " + entityObj );
   }
};

ZeidonViewCursors.prototype.validateCursors = function( entity ) {
   var entityCursor;
   while ( entity ) {
      if ( entity === this._root ) {
         return true; // everything looks good
      }
      var entityCursor = this.getItem( entity );
      if ( entityCursor && entityCursor.getEI() ) {
         entity = entityCursor.getParentEntity();
      } else {
         break;
      }
   }
   return false;
};

/*
 zPOS_NONE  = 0;
 zPOS_FIRST = 1;
 zPOS_LAST  = 2;
 zPOS_NEXT  = 3;
 zPOS_PREV  = 4;

 zCURSOR_NULL = -3
 zCURSOR_UNDEFINED = -2
 zCURSOR_UNCHANGED = -1
 zCURSOR_SET = 0
 zCURSOR_SET_NEWPARENT = 1
 zCURSOR_SET_RECURSIVE_CHILD = 2
*/

ZeidonViewCursors.prototype.hasAnyWithinOi = function( searchEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, this._root, searchAttribute, searchValue, 1, true, false );
};

ZeidonViewCursors.prototype.checkExistenceOfEntity = function( searchEntity ) {
   return this.hasAny( searchEntity );
};

ZeidonViewCursors.prototype.hasAny = function( searchEntity, scopingEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, scopingEntity, searchAttribute, searchValue, 1, false, false );
};

ZeidonViewCursors.prototype.hasNext = function( searchEntity ) {
   return this.setWithinOi( searchEntity, null, null, null, 3, false, false );
};

ZeidonViewCursors.prototype.hasPrev = function( searchEntity ) {
   return this.setWithinOi( searchEntity, null, null, null, 4, false, false );
};

ZeidonViewCursors.prototype.setWithinOi = function( searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, establishPosition ) {
   if ( typeof searchAttribute === "undefined" ) searchAttribute = null;
   if ( typeof searchValue === "undefined" ) searchValue = null;
   if ( typeof scopingEntity === "undefined" || scopingEntity === null ) {
      scopingEntity = this.findParentEntity( searchEntity );
   }
   if ( belowScope || this.validateCursors( searchEntity ) ) {
      var entityCursor = this.getItem( "_" );
      if ( entityCursor ) {
         var entityObj = entityCursor.getEI();
         if ( entityObj ) {
            // this.locateEntity( entityObj, searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, entity, establishPosition, recurse, path );
            var rc = this.locateEntity( entityObj, searchEntity, scopingEntity, searchAttribute, searchValue, position, belowScope, this._root, establishPosition, 0, "" );
            if ( rc >= 0 ) {
               return rc; // zCURSOR_SET
            }
            return -2; // zCURSOR_UNDEFINED
         }
      }
      return -3; // zCURSOR_NULL;
   }
   return -4; // ???
};

ZeidonViewCursors.prototype.setFirstWithinOi = function( searchEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, this._root, searchAttribute, searchValue, 1, true, true );
};

ZeidonViewCursors.prototype.setFirst = function( searchEntity, scopingEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, scopingEntity, searchAttribute, searchValue, 1, false, true );
};

ZeidonViewCursors.prototype.setLastWithinOi = function( searchEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, this._root, searchAttribute, searchValue, 2, true, true );
};

ZeidonViewCursors.prototype.setLast = function( searchEntity, scopingEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, scopingEntity, searchAttribute, searchValue, 2, false, true );
};

ZeidonViewCursors.prototype.setNext = function( searchEntity, scopingEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, scopingEntity, searchAttribute, searchValue, 3, false, true );
};

ZeidonViewCursors.prototype.setPrev = function( searchEntity, scopingEntity, searchAttribute, searchValue ) {
   return this.setWithinOi( searchEntity, scopingEntity, searchAttribute, searchValue, 4, false, true );
};

// This runs through the descendent entities of the recursive entity to set their EI.
ZeidonViewCursors.prototype.setSubobjectEI = function( entityObject, entity, map ) {
   if ( typeof entityObject === "object" ) {
      if ( $.isArray( entityObject ) ) {
      // console.log( "setSubobjectEI Array: " + entityObject.length );
         if ( entity !== null && typeof( entityObject[0] ) === "object" ) {
            if ( map.get( entity ) === null ) {
            // console.log( "setSubobjectEI SetEI for entity: " + entity + "  Tag: " + entityObject[0]["Tag"] );
               map.add( entity, entityObject[0] );
               var entityCursor = this.getItem( entity );
               entityCursor.setEI( entityObject, 0 );
            }
            this.setSubobjectEI( entityObject[0], null, map );
         } else {
         // console.log( "setSubobjectEI Unknown Array object: " + typeof( entityObject[0] ) + "  Object: " + entityObject[0] );
            for ( var k = 0; k < entityObject.length; k++ ) {
               this.setSubobjectEI( entityObject[k], null, map );
            }
         }
      } else { // it's not an array
         var typeProp;
         for ( var prop in entityObject ) {
            typeProp = typeof entityObject[prop];
            if ( typeProp === "object" ) {
               if ( prop.charAt( 0 ) !== "." ) // && prop !== "OIs" ) {  // should not be possible for it to be OIs
               //console.log( "setSubobjectEI Object: " + prop );
                  if ( $.isArray( entityObject[prop] ) && typeof( entityObject[prop][0] ) === "object" ) {
                     this.setSubobjectEI( entityObject[prop], prop, map );
               /* } else {
                     console.log( "setSubobjectEI Unknown Subobject: " + typeProp + "  Object: " + entityObject + "   Prop: " + prop );
               */ }
               }
         /* } else if ( typeProp === "string" || typeProp === "number" || typeProp === "function" || typeProp === "undefined" ) {
               console.log( "setSubobjectEI " + typeProp + " key : value ==> " + prop + " : " + entityObject[prop] );
            } else if ( typeProp === "boolean" ) {
               console.log( "setSubobjectEI boolean key : value ==> " + prop + " : " + entityObject[prop] ? "Y" : "N" );
            } else {
               console.log( "setSubobjectEI Unknown: " + typeProp + "  Object: " + entityObject );
            } */
         }
      }
   } else {
      console.log( "setSubobjectEI Unexpected: " + entityObject );
   }
};

// This is to traverse all entities that are not descendents of the recursive entity to mark them as out of scope.
ZeidonViewCursors.prototype.processParentsRecurse = function( entity, entityCursor, recursiveEntity ) {
   var flag = entityCursor.getFlag();
// console.log( "setToSubobjectRecurse Entity: " + entity + "  flag: " + flag );
   if ( flag ) {
      return flag; // 1 ==> the recursive entity is NOT in the path; 2 ==> the recursive entity is in the path
   }
   var parentEntity = entityCursor.getParentEntity();
   var entityCursorParent = this.getItem( parentEntity );
   flag = this.processParentsRecurse( parentEntity, entityCursorParent, recursiveEntity );
   entityCursor.setFlag( flag );
// console.log( "setToSubobjectRecurse Entity: " + entity + "  setting flag: " + flag + "   Parent: " + parentEntity );
   if ( flag === 2 ) {
      entityCursor.copy(); // this entity is a child of the recursive entity
   } else if ( flag === 1 ) {
      entityCursor.incrementOutOfScope();
   } else {
      throw new Error( "setToSubobject invalid return: " + flag );
   }
   return flag;
};

ZeidonViewCursors.prototype.setToSubobject = function( recursiveEntity ) {
   var recursiveEntityCursor = this.getItem( recursiveEntity );
   if ( recursiveEntityCursor && recursiveEntityCursor.getRecursive() ) { // this had better be found (e.g. BlockBlock) and have the recursive flag set
      var entity = this.getParentEntity( recursiveEntity ); // this cannot be null (e.g. Block)
      var entityCursor = this.getItem( entity );
      this.iterate( function( key, value ) { // reset all flags
         value.setFlag( 0 );
      });
   // console.log( "setToSubobject After iterate1" );
   // this.display("Tag");

      // Mark the originals as processed, make copies and point to them from the originals.
      recursiveEntityCursor.setFlag( 2 ); // 2 ==> the recursive entity is in the path
      entityCursor.setFlag( 2 );
      recursiveEntityCursor.copy(); // this is BlockBlock which will become Block
      entityCursor.copy(); // this is Block
      entityCursor.setEI( recursiveEntityCursor.getArray(), recursiveEntityCursor.getCursor() ); // moves Block down to BlockBlock
      recursiveEntityCursor.setEI( null, -1 );
   // console.log( "setToSubobject After copy" );
   // this.display("Tag");

      // The rest of the way up the ladder, increment "OutOfScope" and set the "processed flag".
      var tempEntityCursor;
      var tempEntity = entityCursor.getParentEntity();
      while ( tempEntity ) {
         tempEntityCursor = this.getItem( tempEntity );
         tempEntityCursor.setFlag( 1 ); // 1 ==> the recursive entity is NOT in the path
         tempEntityCursor.incrementOutOfScope();
         tempEntity = tempEntityCursor.getParentEntity();
      }
   // console.log( "setToSubobject After tempEntity" );
   // this.display("Tag");
      // Mark all entities that are not children of the recursive entity as "out of scope" and
      // create a new entity cursor for each child entity.
      this.iterate( function( key, value ) { // handle each entity
      // console.log( "setToSubobject Entity: " + key + "  flag: " + value.getFlag() );
         if ( value.getFlag() === 0 ) {
            this.processParentsRecurse( key, value, entity );
         }
      }.bind(this)); // force "this" in the inside function to be "ZeidonViewCursors"

   // console.log( "setToSubobject After iterate2" );
   // this.display("Tag");

      var map = new SimpleHashMap( "string", "object" );
   // var entityObj = recursiveEntityCursor.getEI();
      var parentObj = entityCursor.getEI();
      this.setSubobjectEI( parentObj, entity, map );
      return 0;
   }
   return -1;
};

ZeidonViewCursors.prototype.resetFromSubobject = function() {
   var entityCursor = this.getItem( "_" );
   var scope = entityCursor.getOutOfScope();
   if ( scope ) {
      this.iterate( function( key, value ) { // reset all flags
         if ( value.getOutOfScope() ) {
            value.decrementOutOfScope();
         } else {
            value.reset();
         }
      });
      return 0;
   }
   return -1;
};

ZeidonViewCursors.prototype.getIndexFromPosition = function( cursor, position, entityArray ) {
   var index;
   var length = entityArray.length;
   if ( length === 0 ) {
      index = -1;
   } else if ( position === 1 ) { // POS_FIRST
      index = length > 0 ? 0 : -1;
   } else if ( position === 2 ) { // POS_LAST
      index = length > 0 ? length : -1;
   } else if ( position === 3 ) { // POS_NEXT
      index = cursor <= length ? cursor + 1 : length;
   } else if ( position === 4 ) { // POS_PREV
      index = cursor > 0 ? cursor - 1 : 0;
   } else { // POS_NONE
      index = cursor;
   }
   return index;
};

ZeidonViewCursors.prototype.createEntity = function( entity, position ) {
   var parentEI = this.getParentEI( entity );
   if ( parentEI ) { // we must have a parent instance
      var entityCursor = this.getItem( entity );
      var entityArray = entityCursor.getArray();
      var cursor;
      var ei = this.getEI( entity );
      if ( ei ) {
         // At least one of these entities exist, so we determine current position.
         cursor = entityCursor.getCursor();
         cursor = this.getIndexFromPosition( cursor, position, entityArray );
      } else {
         cursor = 0;
         // Need to create the array for this type of entity under the parent object.
         entityArray = [];
         parentEI[entity] = entityArray; // JavaScript only allows strings as property names
      }
      ei = new Object();
      entityArray.splice( cursor, 0, ei );
      var MetaIncrementals = new Object();
      MetaIncrementals["incrementals"] = "UC";
      ei[".meta"] = MetaIncrementals;
      entityCursor.setEI( entityArray, cursor );
      return 0; // fine, well and dandy
   } else {
      return -1; // no parent entity
   }
};

ZeidonViewCursors.prototype.deleteEntity = function( entity, position ) {
   var parentEI = this.getParentEI( entity );
   if ( parentEI ) { // we must have a parent instance
      var entityCursor = this.getItem( entity );
      var entityArray = entityCursor.getArray();
      var cursor;
      var ei = this.getEI( entity );
      if ( ei ) {
         // At least one of these entities exist, so we determine current position.
         var meta = ei[".meta"];
         if ( meta ) {
            var incrementals = meta["incrementals"];
            if ( incrementals.indexOf( "D" ) < 0 ) {
               incrementals += "D";
            }
            meta["incrementals"] = incrementals;
         }
         ei[".deleted"] = true;
         cursor = entityCursor.getCursor();
         cursor = this.getIndexFromPosition( cursor, position, entityArray );
         if ( position ) {
            var reverse = false;
            var length = entityArray.length;
            while ( cursor >= 0 && cursor <= length ) {
               var ei = entityArray[cursor];
               if ( ! ei || ei[".deleted"] ) {
                  if ( position === 1 || position === 3 ) {
                     if ( cursor >= length ) {
                        if ( reverse ) {
                           cursor = -1;
                           break;
                        } else {
                           reverse = true;
                           position++; // go to 2 or 4
                           cursor = length - 1;
                        }
                     } else {
                        cursor++;
                     }
                  } else { // position is 2 or 4
                     if ( cursor === 0 ) {
                        if ( reverse ) {
                           cursor = -1;
                           break;
                        } else {
                           reverse = true;
                           position--; // go to 1 or 3
                           cursor = 0;
                        }
                     } else {
                        cursor--;
                     }
                  }
               } else {
                  break;
               }
            }
         }
         entityCursor.setEI( entityArray, cursor );
      }
      return 0; // fine, well and dandy
   } else {
      return -1; // no parent entity
   }
};

ZeidonViewCursors.prototype.setAttribute = function( entity, attribute, value ) {
   var ei = this.getEI( entity );
   if ( ei ) {
      ei[attribute] = value;
      return 0;
   }
   return -1;
};

ZeidonViewCursors.prototype.getAttribute = function( entity, attribute ) {
   var ei = this.getEI( entity );
   if ( ei ) {
      return ei[attribute];
   }
   return "";
};

/*
if (typeof Object.create !== 'function') {
    Object.create = function (o) {
        function F() {}
        F.prototype = o;
        return new F();
    };
}
newObject = Object.create(oldObject);
*/

//var storageSession = window.sessionStorage;
var g_LodMap = new SimpleHashMap( "string", "object" );
var g_ViewNameMap = new ZeidonViewNames();