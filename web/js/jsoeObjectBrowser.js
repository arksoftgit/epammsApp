function loadViewNames() {
   var el = document.getElementById( "ViewNames" );
// alert( "viewNames html element: " + el );
   var viewNamesArray = window.opener.g_ViewNameMap.keys();
// alert( viewNamesArray.length + viewNamesArray.toString() );
   el.length = 1;
   for ( var k = 0; k < viewNamesArray.length; k++ ) {
      el[ el.length ] = new Option( viewNamesArray[k], viewNamesArray[k] ); 
   }
// alert( window.opener.g_ViewNameMap.toString( "ViewMap" ) );
}

function ViewNameChanged() {
   var viewNames = $id("ViewNames");
// alert( "ViewNameChanged html element: " + viewNames );
   if ( viewNames ) {
      var viewName = viewNames.options[viewNames.selectedIndex].value;
   // alert( "ViewNameChanged selected view: " + viewName );
      var json = window.opener.g_ViewNameMap.getViewByName( viewName );
   // alert( "ViewNameChanged selected json: " + json );
      $id("RawJson").value = JSON.stringify( json );
      Process();
   }
}

function Process() {
   SetTab();
   window.IsCollapsible = $id("CollapsibleView").checked;
   window.ViewMeta = $id("ViewMeta").checked;
   var json = $id("RawJson").value;
// var json = g_jsonLabel;
   var formattedHtml = "";
   try {
      if ( json === "" ) {
         json = "\"\"";
      }
      var jsonObj = jsonStringToJsonObject( json );
      var oiName = "LLD";
      var jsonObject;
      if ( oiName ) {
         jsonObject = findOiByName( oiName, jsonObj );
         if ( jsonObject === null ) {
            jsonObject = jsonObj[0];
         }
      } else {
         jsonObject = jsonObj[0];
      }

      formattedHtml = renderJsonObjectAsFormattedHtml( jsonObject, 0, false, false, false );
      $id("zFormattedJsonLabel").innerHTML = "<PRE class='CodeContainer'>" + formattedHtml + "</PRE>";
   } catch(e) {
      alert( "JSON is not well formatted:\n" + e.message );
      $id("zFormattedJsonLabel").innerHTML = "";
   }
}

function renderJsonObjectAsFormattedHtml( jsonObj, indent, addComma, isArray, isPropertyContent ) {
   var formattedHtml = "";
   var comma = (addComma) ? "<span class='Comma'>,</span> " : "";
   var objType = typeof jsonObj;
   var collapseHtml = "";
   if ( $.isArray( jsonObj ) ) {
      if ( jsonObj.length === 0 ){
         formattedHtml += getRow( indent, "<span class='ArrayBrace'>[ ]</span>" + comma, isPropertyContent );
      } else {
         collapseHtml = window.IsCollapsible ? "<span><img src=\"" + window.ImgExpanded + "\" onClick=\"ExpImgClicked(this)\" /></span><span class='collapsible'>" : "";
         formattedHtml += getRow( indent, "<span class='ArrayBrace'>[</span>" + collapseHtml, isPropertyContent );
         for ( var k = 0; k < jsonObj.length; k++ ) {
            formattedHtml += renderJsonObjectAsFormattedHtml( jsonObj[k], indent + 1, k < (jsonObj.length - 1), true, false );
         }
         collapseHtml = window.IsCollapsible ? "</span>" : "";
         formattedHtml += getRow( indent, collapseHtml + "<span class='ArrayBrace'>]</span>" + comma, false );
      }
   } else if ( objType === "object" ) {
      if ( jsonObj === null ){
         formattedHtml += formatLiteral( "null", "", comma, indent, isArray, "Null" );
      } else if ( jsonObj.constructor === window._dateObj.constructor ) {
         formattedHtml += formatLiteral( "new Date(" + jsonObj.getTime() + ") /*" + jsonObj.toLocaleString() + "*/", "", comma, indent, isArray, "Date" );
      } else if ( jsonObj.constructor === window._regexpObj.constructor ) {
         formattedHtml += formatLiteral( "new RegExp(" + jsonObj + ")", "", comma, indent, isArray, "RegExp" );
      } else {
         var numProps = 0;
         var type = false;
         var content = false;
         var attributes = false;
         for ( var prop in jsonObj ) {
            if ( prop === "type" ) {
               if ( jsonObj[prop] !== "DIV" ) {
                  numProps = 0;
                  break;
               }
               type = true;
            } else if ( prop === "content" ) {
               content = true;
            } else if ( prop === "attributes" ) {
               attributes = true;
            }
            numProps++;
         }
         if ( numProps === 0 ) {
            formattedHtml += getRow( indent, "<span class='ObjectBrace'>{ }</span>" + comma, isPropertyContent );
         } else {
            collapseHtml = window.IsCollapsible ? "<span><img src=\"" + window.ImgExpanded + "\" onClick=\"ExpImgClicked(this)\" /></span><span class='collapsible'>" : "";
            formattedHtml += getRow( indent, "<span class='ObjectBrace'>{</span>" + collapseHtml, isPropertyContent );
            var j = 0;
            var skip = type && content && attributes;
            var quote = window.QuoteKeys ? "\"" : "";
            if ( skip ) {
               formattedHtml += getRow( indent + 1, "<span class='PropertyName'>" + quote + "type" + quote + "</span>: " + renderJsonObjectAsFormattedHtml( jsonObj["type"], indent + 1, ++j < numProps, false, true ), false );
               formattedHtml += getRow( indent + 1, "<span class='PropertyName'>" + quote + "attributes" + quote + "</span>: " + renderJsonObjectAsFormattedHtml( jsonObj["attributes"], indent + 1, ++j < numProps, false, true ), false );
               formattedHtml += getRow( indent + 1, "<span class='PropertyName'>" + quote + "content" + quote + "</span>: " + renderJsonObjectAsFormattedHtml( jsonObj["content"], indent + 1, ++j < numProps, false, true ), false );
            }
            for ( var prop in jsonObj ) {
               if ( skip ) {
                  if ( prop === "type" || prop === "content" || prop === "attributes" ) {
                     continue;
                  }
               } else if ( window.ViewMeta || prop.charAt( 0 ) !== "." ) {
                  formattedHtml += getRow( indent + 1, "<span class='PropertyName'>" + quote + prop + quote + "</span>: " + renderJsonObjectAsFormattedHtml( jsonObj[prop], indent + 1, ++j < numProps, false, true ), false );
               }
            }
            collapseHtml = window.IsCollapsible ? "</span>" : "";
            formattedHtml += getRow( indent, collapseHtml + "<span class='ObjectBrace'>}</span>" + comma, false );
         }
      }
   } else if ( objType === "string" ) {
      formattedHtml += formatLiteral( jsonObj.toString().split("\\").join("\\\\").split('"').join('\\"'), "\"", comma, indent, isArray, "String" );
   } else if ( objType === "number" ) {
      formattedHtml += formatLiteral( jsonObj, "", comma, indent, isArray, "Number" );
   } else if ( objType === "boolean" ) {
     formattedHtml += formatLiteral( jsonObj, "", comma, indent, isArray, "Boolean" );
   } else if ( objType === "function" ) {
      if ( jsonObj.constructor === window._regexpObj.constructor ) {
         formattedHtml += formatLiteral( "new RegExp(" + jsonObj + ")", "", comma, indent, isArray, "RegExp" );
      } else {
         jsonObj = formatFunction( indent, jsonObj );
         formattedHtml += formatLiteral( jsonObj, "", comma, indent, isArray, "Function" );
      }
   } else if ( objType === "undefined" ) {
      formattedHtml += formatLiteral( "undefined", "", comma, indent, isArray, "Null" );
   } else {
      formattedHtml += "UNKNOWN type: " + objType;
   }
   return formattedHtml;
}

function formatLiteral( literal, quote, comma, indent, isArray, style ) {
   var str;
   if ( indent >= 0 ) {
      if ( typeof literal === "string" ) {
         literal = literal.split("<").join("&lt;").split(">").join("&gt;");
      }
      str = "<span class='" + style + "'>" + quote + literal + quote + comma + "</span>";
      if ( isArray ) {
         str = getRow( indent, str, false );
      }
   } else {
      str = quote + literal + quote + comma;
   }
   return str;
}

function formatFunction( indent, obj ) {
   var tabs = buildTab( indent, false );
   var funcStrArray = obj.toString().split( "\n" );
   var str = "";
   for ( var k = 0; k < funcStrArray.length; k++ ) {
      str += ((k === 0) ? "" : tabs) + funcStrArray[k] + "\n";
   }

   return str;
}

function getRow( indent, data, isPropertyContent ) {
   var tabs = "";
   if ( indent >= 0 ) {
      for ( var k = 0; k < indent && !isPropertyContent; k++ ) {
         tabs += window.TAB;
      // tabs += window.DOUBLE_TAB;
      }
      if ( data !== null && data.length > 0 && data.charAt( data.length - 1 ) !== "\n" )
         data = data + "\n";
   }
   return tabs + data;
}

function ViewMetaClicked() {
    Process();
}

function CollapsibleViewClicked() {
   $id("CollapsibleViewDetail").style.visibility = $id("CollapsibleView").checked ? "visible" : "hidden";
   Process();
}

function CollapseAllClicked() {
   EnsureIsPopulated();
   TraverseChildren( $id("zFormattedJsonLabel"), function( element ) {
      if ( element.className === 'collapsible' ) {
         MakeContentVisible(element, false);
      }
   }, 0 );
}

function ExpandAllClicked() {
   EnsureIsPopulated();
   TraverseChildren( $id("zFormattedJsonLabel"), function( element ) {
      if ( element.className === 'collapsible' ) {
         MakeContentVisible( element, true );
      }
   }, 0 );
}

function MakeContentVisible( element, visible ) {
   var img = element.previousSibling.firstChild;
   if ( !!img.tagName && img.tagName.toLowerCase() === "img" ) {
      element.style.display = visible ? "inline" : "none";
      element.previousSibling.firstChild.src = visible ? window.ImgExpanded : window.ImgCollapsed;
   }
}

function TraverseChildren( element, func, depth ) {
   for( var i = 0; i < element.childNodes.length; i++ ) {
      TraverseChildren( element.childNodes[i], func, depth + 1 );
   }
   func( element, depth );
}

function CollapseLevel() {
   EnsureIsPopulated();
   var collapseLevel = $id("CollapseLevel");
   var level;
   if ( collapseLevel ) {
      level = parseInt( collapseLevel.options[collapseLevel.selectedIndex].value );
   } else {
      level = 3;
   }
   if ( level === -1 ) {
      CollapseAllClicked();
   } else if ( level === 0 ) {
      ExpandAllClicked();
   } else {
      level += 2;
      TraverseChildren( $id("zFormattedJsonLabel"), function( element, depth ) {
         if ( element.className === 'collapsible' ) {
            if ( depth >= level ) {
               MakeContentVisible( element, false );
            } else {
               MakeContentVisible( element, true );
            }
         }
      }, 0 );
   }
}

function ExpImgClicked( img ) {
   var container = img.parentNode.nextSibling;
   if ( !container ) {
      return;
   }
   var disp = "none";
   var src = window.ImgCollapsed;
   if ( container.style.display === "none" ){
      disp = "inline";
      src = window.ImgExpanded;
   }

   container.style.display = disp;
   img.src = src;
}

function TabSizeChanged() {
   Process();
}

function SetTab() {
   var select = $id("TabSize");
   var indent;
   if ( select ) {
      indent = parseInt( select.options[select.selectedIndex].value );
   } else {
      indent = 3;
   }
   window.TAB = MultiplyString( indent, window.SINGLE_TAB );
}

function EnsureIsPopulated() {
   if ( !$id("zFormattedJsonLabel").innerHTML && !!$id("RawJson").value ) // the !! is to cause $id("RawJson").value to be evaluated as a boolean 
      Process();
}
