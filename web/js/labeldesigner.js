$(window).load( function() {
$(function() {

// $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

   var g_updatedLLD = false;
   var g_application = "epamms";
   var g_currentPage = 1;
   var g_$current_block = null;
   var g_selected_first = null;
   var g_selected_list = [];
   var g_undo_list = [];
   var g_generateTag = 100;
   var g_xOffset = 0;
   var g_yOffset = 0;
// var g_cursorsLabel;
   var g_currentSnapX = 0.50;
   var g_currentSnapY = 0.50;
   var g_currentType = null;
   var g_scale = 1;
   var g_pixelsPerInch = 81;
   var g_pixelsBorder = 2;
   
   var g_scrollbar = null;
   var g_windowHeight = -1;
   var g_windowWidth = -1;
// var g_ppiX = -1;
// var g_ppiY = -1;
// var g_ppcmX = -1;
// var g_ppcmY = -1;

   var g_metaVersion = "";
   var g_metaDate = "";
   
   var g_jsonColors = [];
   var g_jsonBlockTags = [];
// var g_jsonLabel2;

// var storageSession = window.sessionStorage;
// var storageLocal = window.localStorage;
// alert( "Session: " + storageSession.registeredViews );
// alert( "Local: " + storageLocal.registeredViews );
// var rv = storageSession.getItem( "registeredViews" );
// var objRV = JSON.parse( rv ) || {};
// alert( "Session objRV: " + objRV.toString() );

   $("#page").data( "z_^depth", 0 );
   $("#page2").data( "z_^depth", 0 );
   $("#page3").data( "z_^depth", 0 );
   $("#page4").data( "z_^depth", 0 );
   $("#page5").data( "z_^depth", 0 );
   $("#page6").data( "z_^depth", 0 );
   $("#page7").data( "z_^depth", 0 );
   $("#page8").data( "z_^depth", 0 );
   $("#page9").data( "z_^depth", 0 );
   $("#zaccordion").accordion( {heightStyle: "fill"} );
   $(function() {
        var icons = {
            header: "ui-icon-circle-arrow-e",
            headerSelected: "ui-icon-circle-arrow-s"
        };
        $("#zaccordion").accordion({
            icons: icons,
            collapsible: true
        });
        $("#toggle").button().toggle( function() {
            $("#zaccordion").accordion( "option", "icons", false );
        }, function() {
            $("#zaccordion").accordion( "option", "icons", icons );
        });
    });

   $("#zmbp").tabs({
      // event: "mouseover"
   });

   $(".zalign-btn").click( function() {
      runAlign( this );
      return false;  // prevent default propagation
   });

   function clearListAndSelection( current_selected ) {
      var el;
      while ( g_selected_list.length > 0 ) {
         el = g_selected_list.pop(); // The shift() method removes the first item of an array, and returns that item.
                                     // To remove the last item of an array, use the pop() method
      // $el.removeClass( "ctrl-selected" );
      // $el.removeClass( "first-selected" );
         $(el).css( "border", "2px solid #000" );
      }
      g_selected_first = current_selected;
      if ( current_selected ) {
         g_selected_list.push( current_selected ); // The push() method adds new items to the end of an array, and returns the new length.
                                                   // To add items at the beginning of an array, use the unshift() method.
      // $(current_selected).addClass( "first-selected" );
         $(current_selected).css( "border", "2px solid #FF7777" );
      }
   }

   function addType( $element ) {
      var path = "LLD_";
      if ( $element.hasClass( "panel" ) ) {
         path += "Panel.";
      } else {
         path += "Block."; 
      }
      path += $element.attr( "id" ) + ";";
      return path;
   }

   function getParentagePathKeys( $element ) {
      var parent_array = $element.parents( ".canvas-element" );
      var path = "LLD_Page." + "page" + g_currentPage + ";";
      var $el;
      for ( var k = parent_array.length - 1; k >= 0; k-- ) {
         $el = $(parent_array[k]);
         path += addType( $el );
      }
      path += addType( $element );
      return path;
   }

   function updateBlockCallback( element ) {
      var $element = $(element);
      g_updatedLLD = false;
      var parentagePath = getParentagePathKeys( $element );
      var keys = $element.data( "z_^i^d" ) + ";" + $element.data( "z_w^i^d" ) + ";" + $element.data( "z_w^p^e" );
      var n = keys.search( "undefined" );
      if ( n >= 0 ) {
         alert( "Looking for invalid block: " + keys );
      } else {
         var elementKey = addType( $element ) + keys;
         var url = "labeldesigner?action=setCursorPosition&viewName=" + escape( "mSPLDef" ) + "&viewPath=" + escape( parentagePath ) + "&elementKey=" + escape( elementKey );
         $.ajax({ url: url,
                  type: "post", // string defining the HTTP method to use for the request: GET (default) or POST
                  contentType: "application/json; charset=utf-8",
                  dataType: "json", // defines the type of data expected back from the server (xml, html, json, or script)
                  processData: true, // boolean (default:true) indicating whether to convert the submitted data from an object form into a query-string form
                  data: {},
               // beforeSend - callback function that is executed before the request is sent
                  success: function( data, textStatus, jqXHR ) {
                           // console.log( "setCursorPosition: success status: " + textStatus + "  data: " + data + "  jqXHR: " + jqXHR );
                              GOTO_UpdateBlock();
                           },
                  error:   function( jqXHR, textStatus, errorThrown ) {
                           // console.log( "setCursorPosition: error xhr response: " + jqXHR.responseText + "  status: " + textStatus + "  error: " + errorThrown );
                              alert( "Error: " + errorThrown );
                           },
                  complete: function( jqXHR, textStatus ) { // callback function that executes whenever the request finishes
                           // console.log( "setCursorPosition: complete status: " + textStatus + "  response: " + jqXHR.responseText );
                           }
         });
      }
   }

   function saveLabel( commit, callback ) {
      mapUiDataToElementData( g_$current_block );
      if ( g_updatedLLD || commit === "Commit" ) {
         var dup = getBlockTagList();
         if ( dup !== null ) {
            alert( "Duplicate Tag: " + dup );
            return;
         }
         ConvertWysiwygLabelDesignToZeidonJson( "saveLabel" + commit , "mSPLDef", callback, null, null );
         g_updatedLLD = false;
      } else {
      // alert( "Not Changed" );
         if ( callback ) {
            callback();
        }
      }      
   }

   function returnCallback() {
      Return();
   }

   $("#Return").click( function() {
      if ( g_updatedLLD ) {      
         saveLabel( "", returnCallback );
         g_updatedLLD = false;
      } else {
      // alert( "Not Changed" );
         Return();
      }
   });

   function reloadCallback() {
      LoadZeidonJsonFromLLD( "mSPLDef" );
   }

   $("#Save").click( function() {
      saveLabel( "Commit", reloadCallback );
   // SaveLLD(); don't do this
   });

   function generateLabelCallback() {
      if ( $("#labelBorders").is( ":checked" ) ) {
         GenerateLabelBorders();
      } else {
         GenerateLabel();
      }
   }

   $("#GenerateSPLD_Label").click( function() {
      saveLabel( "", generateLabelCallback );
   });

   $("#UpdateBlock").click( function() {
      if ( g_$current_block ) {
         mapUiDataToElementData( g_$current_block );
         if ( g_$current_block.hasClass( "panel" ) === false ) {
            var sectionType = g_$current_block.data( "z_^l^l^d_^section^type" );
            sessionStorage.setItem( "epamms_section_type", sectionType );
            if ( g_updatedLLD ) {
            // alert( "Changed" );
               ConvertWysiwygLabelDesignToZeidonJson( "saveLabel", "mSPLDef", updateBlockCallback, g_$current_block, null );
            } else {
            // alert( "Not Changed" );
               updateBlockCallback( g_$current_block );
            }
         } else {
            alert( "Update panel via tools" );
         }
      } else {
         alert( "No block selected" );
      }
   });

   $("#ReuseBlock").click( function() {
      if ( g_$current_block ) {
         mapUiDataToElementData( g_$current_block );
         if ( g_$current_block.hasClass( "panel" ) === false ) {
            ConvertWysiwygLabelDesignToZeidonJson( "saveReusableBlock", "mSPLDef", reloadCallback, g_$current_block, null );
         } else {
            alert( "Cannot save panel" );
         }
      } else {
         alert( "No block selected" );
      }
   });

/*
   $("#zLLD_Save").click( function( e ) {
      e.preventDefault();
      saveLabel( "Commit" );
      return false;  // prevent default propagation
   });

   $("#zLLD_Reload").click( function( e ) {
      e.preventDefault();
      if ( g_updatedLLD ) {
         if ( window.confirm( "Current label has been updated.  Do you want to overwrite changes?" ) === false ) {
            return false;  // prevent default propagation
         }
      // g_updatedLLD = false;  done in LoadZeidonJsonFromLLD
      }
      LoadZeidonJsonFromLLD( "mSPLDef" );
      return false;  // prevent default propagation
   });
*/
   // Create/maintain list of selected elements:
   // When an element is clicked add/remove selected elements to the list and set css class appropriately:
   //  - if no element has been selected:
   //     - make the element the first selected
   //     - add element to selected list
   //  - otherwise:
   //     - if the Ctrl key is down:
   //        - if the element is already selected, remove from the selected list and set the first selected appropriately
   //        - else add the element to the selected list and set the first selected appropriately
   //     - else
   //        - if there is a parent of the selected element, select the parent
   //        - set the element as the first selected and add as the only element in the selected list
   $("body").on( "dblclick", ".canvas-element", function(e) {
   // console.log( "Double Click on canvas-element: " + this.id + " has been pressed!" );
      if ( $(this).hasClass( "panel" ) === false ) {
         var sectionType = $(this).data( "z_^l^l^d_^section^type" );
         sessionStorage.setItem( "epamms_section_type", sectionType );
         if ( g_updatedLLD ) {
            ConvertWysiwygLabelDesignToZeidonJson( "saveLabel", "mSPLDef", updateBlockCallback, this, null );
         } else {
            updateBlockCallback( this );
         }
         return false;
      } else {
         alert( "Update panel via tools" );
      }
   });
   
   $("body").on( "click", ".canvas-element", function(e) {
   // console.log( "Click on canvas-element: " + this.id + " has been pressed!" );
      if ( g_selected_first === null || e.ctrlKey === false ) {
         var el = this;
      // displayElementData( "on click: ", $(el) );
         if ( g_selected_first ) { // try to select up through parentage
            var parent_array = $(this).parents( ".canvas-element" );
            var found = false;
            for ( var k = 0; k < parent_array.length; k++ ){
               if ( parent_array[k] === g_selected_first ) {
                  if ( k < parent_array.length - 1 ) {
                     el = parent_array[k + 1];
                  } else {
                     el = this;
                  }
                  found = true;
                  break;
               }
            }
            if ( found === false && parent_array.length > 0 && g_selected_first === this ) {
               el = parent_array[0];
            }
         }
         setCurrentBlockData( $(el), "on click" );
         clearListAndSelection( el ); // clear the list and set current selection
         updatePositionStatus( el, el.offsetTop, el.offsetLeft, "Start yOffset" );
         updateSizeStatus( el, el.offsetHeight, el.offsetWidth, "Start yOffset" );
      } else if ( e.ctrlKey ) { // Ctrl + click combo
      // console.log( "Ctrl+Click on canvas-element has been pressed!" );
         var idx = g_selected_list.indexOf( this );
         if ( idx >= 0 ) { // remove this ... already in the list so deselect
            g_selected_list.splice( idx, 1 );
            if ( this === g_selected_first ) {
               $(this).css( "border", "2px solid #000" );
               if ( g_selected_list.length > 0 ) {
                  g_selected_first = g_selected_list[0];
               // g_selected_first.addClass( "ctrl-selected" );
                  $(g_selected_first).css( "border", "2px solid #FF7777" );
               } else {
                  g_selected_first = null;
                  g_$current_block = null;
               }
            }
         } else { // not in list, so add it if it has the same parent as others in the list
            if ( g_selected_first === null || g_selected_list.length === 0 ) {
               clearListAndSelection( this ); // clear the list and set current selection
               g_selected_first = this;
            // $(this).addClass( "first-selected" );
               $(this).css( "border", "2px solid #FF7777" );
               g_selected_list.splice( 0, g_selected_list.length );  // clear the list (shouldn't be necessary)
            } else {
               var el = g_selected_list[0];
               var id = $(el).parent().attr( "id" );
               if ( $(this).parent().attr( "id" ) === id ) {
                  g_selected_list.push( this );
               // $(this).addClass( "ctrl-selected" );
                  $(this).css( "border", "2px solid #A7C8E2" );
               } else {
                  alert( "multi-select items must have the same parent" );
               }
            }
         }
      }
      if ( g_$current_block && g_$current_block.hasClass( "panel" ) === false ) {
         $("#zSectionType").prop( 'disabled', false );
      } else {
         $("#zSectionType").prop( 'disabled', true );
      }

      return false;  // prevent default propagation (otherwise, the click is propagated to parent elements ... which we do not want!)
   });

// $("#zmenu").click( function(e) {
   $("#zmenu").on( "click", function(e) {
      var active = $( "#zaccordion" ).accordion( "option", "active" );
   // console.log( "menu clicked: " + active );
      localStorage.setItem( "epamms_graphic_accordion", active );
   // e.stopPropagation();  if we stop this (return false) check boxes do not stay checked!!!
   // return false;  // prevent propagation, otherwise the click will be passed on to any element underneath the accordion
   });

   // Here is the complete order of events per drag and drop interaction: 
   // draginit > dropinit > dragstart > drag > dropstart > drop > dropend > dragend
   // getter for zIndex:  var zIndex = $(".selector").draggable( "option", "zIndex" );
   // setter for zIndex:  $(".selector").draggable( "option", "zIndex", 100 );
// var drag_zIndex = 0;
   $(".draggable").draggable({
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      helper: "clone",
      appendTo: "body",  // this keeps the drag item visible across divs
      cursor: "move",
      start: function( event, ui ) {
      // alert("Top: " +  $(this).offset().top);
      // console.log( "draggable start ui: " + ui );
      // console.log(ui.draggable);
      // $(this).css( "z-index", 10 );
      // drag_zIndex = $(this).draggable( "option", "zIndex" );
      // $(this).draggable( "option", "zIndex", 100 );
         if ( $(this).hasClass( "canvas-element" ) ) {
            clearListAndSelection( this ); // clear the list and set current selection
         }

         var $parent = $(this).parent();
         var stopLoop = 1; // just to prevent infinite loop in case something goes wrong

         g_xOffset = 0;
         g_yOffset = 0;
         while ( $parent.parent().is( "html" ) === false && stopLoop++ < 40 )
         {
            if ( $parent.is( "div#zclient" ) )
            {
               g_xOffset = 0;
               g_yOffset = 0;
            }

            if ( $parent.is( "div#zviewport" ) )
               break;

         // console.log($parent);
         // console.log( "top: " + Math.round( $parent.position().top ) );
         // console.log( "left: " + Math.round( $parent.position().left ) );
            g_xOffset += $parent.position().left;
            g_yOffset += $parent.position().top;

            $parent = $parent.parent();
         }

      // console.log( "Start yDragPanel: " + Math.round( ui.offset.top - g_yOffset ).toString() + "  xDragPanel: " + Math.round( ui.offset.left - g_xOffset ).toString() );
         updatePositionStatus( $(this), ui.offset.top - g_yOffset, ui.offset.left - g_xOffset, "Start yDragPanel" );
         updateSizeStatus( $(this), $(this).height(), $(this).width(), "Start yDragPanel" );
      },
      drag: function( event, ui ) {
      // console.log( "Drag yDragPanel: " + Math.round( ui.offset.top - g_yOffset ).toString() + "  xDragPanel: " + Math.round( ui.offset.left - g_xOffset ).toString() );
         updatePositionStatus( $(this), ui.offset.top - g_yOffset, ui.offset.left - g_xOffset, "Drag yDragPanel" );
      },
      stop: function( event, ui ) {
      // $(this).draggable( "option", "zIndex", drag_zIndex );
      // $(this).css( "z-index", 0 );
      // updatePositionStatus( $(this), ui.offset.top - yOffset, ui.offset.left - xOffset );
      // console.log( "Stop yDrag: " + Math.round( ui.offset.top - g_yOffset ).toString() + "  xDrag: " + Math.round( ui.offset.left - g_xOffset ).toString() );
      // console.log( "Scroll #label top: " + $("#label").scrollTop() + "   left: " + $("#label").scrollLeft() );
      // $(this).data( "z_^top", Math.round( ui.offset.top - yOffset ).toString() );    not right ... done later
      // $(this).data( "z_^left", Math.round( ui.offset.left - xOffset ).toString() );  not right ... done later
      // setCurrentBlockData( $(this), "updated 1" );
         updatePositionStatus( $(this), ui.offset.top - g_yOffset, ui.offset.left - g_xOffset, "Stop yDrag" );
      // updatePositionStatus( $(this), -9999, -9999 );
      // updateSizeStatus( $(this), -9999, -9999 );
      }
   });

   // Note: "this" is the DOM object, whereas "$(this)" is the jQuery wrapper around the DOM object.
   // When using "this", you can call DOM methods on it, but not jQuery methods. When using "$(this)",
   // you can call jQuery methods on it, but not DOM methods.
   //
   // To create a jQuery element from a DOM element:
   //    var $elem = $(domElem);  // convert DOM element to jQuery element
   //    var htmlElem = $elem[0]; // convert jQuery element to HTML element

   // In the 'drop' event handler function for droppable, the dropped element is: ui.draggable

   function setBlockDraggableResizable( $canvas, $canvasElement, $target ) {
   // console.log( "Canvas: " + $canvas.attr( "id" ) + "  canvasElement: " + $canvasElement.attr( "id" ) + "  target: " + $target.attr( "id" ) );
      $canvasElement.draggable({
         cancel: "a.ui-icon", // clicking a link with class .ui-icon won't initiate dragging
         containment: "#page",
         appendTo: "body",  // this keeps the drag item visible across divs
         cursor: "move",
         start: function( event, ui ) {
            clearListAndSelection( $canvasElement[0] ); // clear the list and set current selection
         // drag_zIndex = $canvasElement.draggable( "option", "zIndex" );
         // $canvasElement.draggable( "option", "zIndex", 100 );
         // $target.css( "z-index", 10 );
         // console.log( "Start yOffset: " + $canvasElement[0].offsetTop + "  xOffset: " + $canvasElement[0].offsetLeft );
            updatePositionStatus( $canvasElement[0], $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft, "Start yOffset" );
            updateSizeStatus( $canvasElement[0], $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth, "Start yOffset" );
         },
         drag: function( event, ui ) {
         // console.log( "Drag yOffset: " + $canvasElement[0].offsetTop + "  xOffset: " + $canvasElement[0].offsetLeft );
            updatePositionStatus( $canvasElement[0], $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft, "Drag yOffset" );
         },
         stop: function( event, ui ) {
         // $canvasElement.draggable( "option", "zIndex", drag_zIndex );
         // $target.css( "z-index", 0 );
         // updatePositionStatus( $canvasElement[0], ui.offset.top - yOffset, ui.offset.left - xOffset );
         // console.log( "Stop yOffset: " + $canvasElement[0].offsetTop + "  xOffset: " + $canvasElement[0].offsetLeft );
            g_updatedLLD = true;
            var scale = g_pixelsPerInch * g_scale;
            $canvasElement.data( "z_^top", ($canvasElement[0].offsetTop / scale).toFixed( 3 ) );
            $canvasElement.data( "z_^left", ($canvasElement[0].offsetLeft / scale).toFixed( 3 ) );
            setCurrentBlockData( $canvasElement, "updated 2" );
            updatePositionStatus( $canvasElement[0], $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft, "Stop yOffset ... z_^top and z_^left" );
         // updatePositionStatus( $canvasElement[0], -9999, -9999 );
         // updateSizeStatus( $canvasElement[0], -9999, -9999 );
         }
      });
      $canvasElement.resizable({
         containment: "#page",
         start: function( event, ui ) { // alert("Top: " +  $target.offset().top);
         // console.log( "Start yResize: " + $canvasElement[0].offsetHeight + "  xResize: " + $canvasElement[0].offsetWidth );
            updatePositionStatus( $canvasElement[0], $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft, "Start yResize" );
            updateSizeStatus( $canvasElement[0], $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth, "Start yResize" );
         },
         resize: function( event, ui ) {
         // console.log( "Resize yResize: " + $canvasElement[0].offsetHeight + "  xResize: " + $canvasElement[0].offsetWidth );
            updateSizeStatus( $canvasElement[0], $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth, "Resize yResize" );
         },
         stop: function( event, ui ) {
         // console.log( "Stop yResize: " + $canvasElement[0].offsetHeight + "  xResize: " + $canvasElement[0].offsetWidth );
            g_updatedLLD = true;
            var scale = g_pixelsPerInch * g_scale;
            $canvasElement.data( "z_^height", (($canvasElement[0].offsetHeight) / scale).toFixed( 3 ) );
            $canvasElement.data( "z_^width", (($canvasElement[0].offsetWidth) / scale).toFixed( 3 ) );
            setCurrentBlockData( $canvasElement, "updated 3" );
            updateSizeStatus( $canvasElement[0], $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth, "Stop yResize ... z_^height and z_^width" );
         // updatePositionStatus( $canvasElement[0], -9999, -9999 );
         // updateSizeStatus( $canvasElement[0], -9999, -9999 );
         }
      });
   }

   $(".page, .block-element").droppable({
      accept: ".draggable",
   // hoverClass: "ui-state-active",  partially highlights page ... not so good
      drop: function( event, ui ) {
      // console.log( ".page, .block-element drop" );
         var stopLoop = 1;
         if ( ui.draggable.hasClass( "canvas-element" ) ) { // dropping panel/block already on canvas
            var $canvasElement = $(ui.helper);
            var $parent = $canvasElement.parent();
            var $canvas = determineTargetOfDrop( event, $(this), $canvasElement );
            if ( $parent[0] !== $canvas[0] ) { // we don't change from panel to block or vice-versa
               if ( $canvasElement.hasClass( "panel" ) === false && $canvas[0] === $("#page")[0] ) {
                  return false;
               }
               var r = confirm( "Do you want to move to a new parent?" );
               if ( r !== true ) {
                  return false;
               }
            }
            addZeidonAttributeToElement( $canvasElement, "wPID", $canvas.data( "z_w^i^d" ) );
            addZeidonAttributeToElement( $canvasElement, "wPE", $canvas.data( "z_w^e" ) );
         // console.log( "Setting1 wPID: " + $canvas.data( "z_w^i^d" ) + "  wPE: " + $canvas.data( "z_w^e" ) );
            if ( true || $parent[0] !== $canvas[0] ) {
               var top = ui.offset.top;
               var left = ui.offset.left;
               while ( $parent[0] !== $canvas[0] && $parent[0].id !== "page" && stopLoop < 40 ) {
                  top += $parent[0].offsetTop + $parent[0].clientTop;
                  left += $parent[0].offsetLeft + $parent[0].clientLeft;
                  $parent = $parent.parent();
                  stopLoop++; // using stopLoop just to prevent infinite loop
               }

               stopLoop = 1;
               var $canvasParent = $canvas;
               while ( $canvasParent[0] !== $parent[0] && $canvasParent[0].id !== "page" && stopLoop < 40 ) {
                  top -= $canvasParent[0].offsetTop + $canvasParent[0].clientTop;
                  left -= $canvasParent[0].offsetLeft + $canvasParent[0].clientLeft;
                  $canvasParent = $canvasParent.parent();
                  stopLoop++;
               }
               var top = Math.round( top );
               var left = Math.round( left );
            // console.log( ".page, .block-element top:" + top + "  left: " + left );
               $canvasElement.offset({ top: top, left: left });
               $canvas.append( $canvasElement );
               addZeidonAttributeToElement( $canvasElement, "wPID", $canvas.data( "z_w^i^d" ) );
               addZeidonAttributeToElement( $canvasElement, "wPE", $canvas.data( "z_w^e" ) );
            // console.log( "Setting2 wPID: " + $canvas.data( "z_w^i^d" ) + "  wPE: " + $canvas.data( "z_w^e" ) );
               setChildrenDepth( $canvas, $canvasElement );
            // setCurrentBlockData( $canvasElement, "updated 7" );
            // $canvasElement.data( "z_^top", Math.round( top ).toString() );   done later
            // $canvasElement.data( "z_^left", Math.round( left ).toString() ); done later
            }
            g_updatedLLD = true;
            setCurrentBlockData( $canvasElement, "updated block already on canvas" );
            clearListAndSelection( $canvasElement[0] ); // clear the list and set current selection
         } else {
            var $canvasElement = $(ui.helper).clone(); // ui.draggable.clone();  dropping new panel/block
         // console.log( ".page, .block-element new block top:" + event.pageY + "  left: " + event.pageX +
         //              "   height: " + $(ui.helper).height() + "   width: " + $(ui.helper).width() );
                      // "   height: " + ($(ui.helper).height() + g_pixelsBorder) + "   width: " + ($(ui.helper).width() + g_pixelsBorder) );
            $canvasElement.height( $(ui.helper).height() ).width( $(ui.helper).width() );
            $canvasElement.css({ top: event.pageY, left: event.pageX });
            var uniqueTag = getUniqueId();
            $canvasElement.attr( "id", uniqueTag );
            var $canvas = determineTargetOfDrop( event, $(this), $canvasElement );
            if ( $canvasElement.hasClass( "reusable" ) ) {
               var reuseBlockName = $("#zReusableBlocks").val();
               if ( reuseBlockName === "" ) {
                  alert( "Reusable block must be selected from list" );
                  return;
               }
               if ( $canvas[0].id === "page" ) {
                  alert( "Reusable blocks must be dropped within a panel" );
                  return;
               }
               addZeidonAttributeToElement( $canvasElement, "wID", uniqueTag );
               addZeidonAttributeToElement( $canvasElement, "wE", "block" );
               addZeidonAttributeToElement( $canvasElement, "wPE", "panel" );
               addZeidonAttributeToElement( $canvasElement, "wPID", $canvas.data( "z_w^i^d" ) );
               var t = Math.floor( ui.position.top - $canvas.offset().top );
               var l = Math.floor( ui.position.left - $canvas.offset().left );
               var s = g_pixelsPerInch * g_scale;
               ConvertWysiwygLabelDesignToZeidonJson( "applyReusableBlock", "mSPLDef", reloadCallback, $canvas, "{ \"top\": \"" + (t / s).toFixed( 3 ) + "\", \"left\": \"" + (l / s).toFixed( 3 ) + "\" }" );
               return;
            }
            $canvasElement.attr( "name", uniqueTag );
            $canvasElement.text( uniqueTag );
            addZeidonAttributeToElement( $canvasElement, "wID", uniqueTag );
            $canvasElement.removeClass( "ui-draggable-dragging" ).addClass( "canvas-element block-element" );
            if ( $canvas[0].id === "page" ) {
               $canvasElement.addClass( "panel" );  // an element with class "panel" cannot become a "block" and vice-versa
               addZeidonAttributeToElement( $canvasElement, "wE", "panel" );
            } else {
               addZeidonAttributeToElement( $canvasElement, "wE", "block" );
            }

            setBlockDraggableResizable( $canvas, $canvasElement, $(this) );

            $canvas.append( $canvasElement );
            addZeidonAttributeToElement( $canvasElement, "wPID", $canvas.data( "z_w^i^d" ) );
            addZeidonAttributeToElement( $canvasElement, "wPE", $canvas.data( "z_w^e" ) );
         // console.log( "Setting3 wPID: " + $canvas.data( "z_w^i^d" ) + "  wPE: " + $canvas.data( "z_w^e" ) );
         // $canvasElement.append( "<h5 class='ui-widget-header'></h5>" );
            $canvasElement.append( "<h5></h5>" );
            $canvasElement.children( ".ui-resizable-handle" ).css( "z-index", "" );  // prevent these from "showing through"
            $canvasParent = $canvas;
            while ( $canvasParent[0].id !== "page" && stopLoop < 40 ) {
               stopLoop++;
               $canvasParent = $canvasParent.parent();
            }

            setChildrenDepth( $canvas, $canvasElement );
         // console.log( ".page, .block-element new block2 top:" + Math.floor( ui.position.top - $canvas.offset().top ).toString() + "px" +
         //              "   left: " + Math.floor( ui.position.left - $canvas.offset().left ).toString() + "px"  +
         //              "   height: 81px   width: 81px" );
            $canvasElement.css({
               position: "absolute",
               top: Math.floor( ui.position.top - $canvas.offset().top ).toString() + "px",
               left: Math.floor( ui.position.left - $canvas.offset().left ).toString() + "px",
               height: pixel2Scale( "81px", 4 ), // pixelsPerInch ... 2*g_pixelsBorder
               width: pixel2Scale( "81px", 4 ) // pixelsPerInch ... 2*g_pixelsBorder
            });
            g_updatedLLD = true;
            var top = Math.floor( ui.position.top - $canvas.offset().top );
            var left = Math.floor( ui.position.left - $canvas.offset().left );
            var scale = g_pixelsPerInch * g_scale;
         // console.log( ".page, .block-element new block data z_^top:" + (top / scale).toFixed( 3 ) +
         //              "  z_^left: " + (left / scale).toFixed( 3 ) +
         //              "   z_^height: " +  "1.00" + "   z_^width: " +  "1.00" );
            $canvasElement.data( "z_^top", (top / scale).toFixed( 3 ) );
            $canvasElement.data( "z_^left", (left / scale).toFixed( 3 ) );
            $canvasElement.data( "z_^height", "1.00" );
            $canvasElement.data( "z_^width", "1.00" );
            setCurrentBlockData( $canvasElement, "updated new block" );
            clearListAndSelection( $canvasElement[0] ); // clear the list and set current selection
         }
      }
   });

/*
   function bindEvents() {
      $('.block').not('.initialized').addClass('initialized').on().resizable().draggable();
   }
*/

   // this scales pixels with respect to the current zoom
   function pixel2Scale( attr ) {
      if ( g_scale === 1 ) {
      // console.log( "pixel2Scale: " + attr + " ==> " + attr );
         return attr;
      } else {
         var idx = attr.indexOf( "px" );
         if ( idx >= 0 ) {
             attr = attr.substring( 0, idx );
         }
         var pixels = parseFloat( attr );
         if ( pixels < 0 ) {
            pixels = 0;
         }
         var n = Math.round( pixels * g_scale );
      // console.log( "pixel2Scale: " + attr + " ==> " + n.toString() + "px" );
         return n.toString() + "px";
      }
   }

   function setCurrentBlockData( $element, message ) {
   // console.log( "setCurrentBlockData: " + message );
   // g_updatedLLD = true; commented because this should be set prior to calling this function as necessary
      mapElementCssToElementData( $element );
      if ( g_$current_block && g_$current_block.attr( "id" ) !== $element.attr( "id" ) ) {
         mapUiDataToElementData( g_$current_block );
      }
      g_$current_block = $element;
      mapElementDataToUiData( g_$current_block );
      $("#zBlockTag").val( $element.attr( "id" ) );
   }

   // this is used to get the number of pixels from the inches value without respect to scale
   function inch2px( attr, border ) {
      var idx = attr.indexOf( "in" );
      if ( idx >= 0 ) {
         attr = attr.substring( 0, idx );
      }
      var pixels = Math.round( parseFloat( attr ) * g_pixelsPerInch ) + border;
      if ( pixels < 0 ) {
         pixels = 0;
      }
   // console.log( "inch2px attr: " + attr + "  px: " + pixels );
      return( pixels + "px" );      
   }

   // this is used to get the number of pixels from the inches value respecting to scale
   function scaledInch2Pixel( attr, border ) {
      var idx = attr.indexOf( "in" );
      if ( idx >= 0 ) {
         attr = attr.substring( 0, idx );
      }
      var inches = parseFloat( attr );
      if ( inches < 0 ) {
         inches = 0;
      }
      var pixels = Math.round( inches * g_pixelsPerInch * g_scale ) + border;
   // console.log( "scaledInch2Pixel attr: " + attr + "  px: " + pixels );
      return pixels;
   }

   function resizeImg() {
      $( "div.page" ).each( function() {
         var $this = $(this);
      // console.log( "Scaling page: " + $this.attr( "id" ) );
         var scale = Math.floor( g_scale * 81 );
         $this.css( 'background-size', scale + "px " + scale + "px" );
      });
      $( ".canvas-element" ).each( function() {
         var $this = $(this);
         var top = scaledInch2Pixel( $this.data( "z_^top" ) || "0", 0 );
         var left = scaledInch2Pixel( $this.data( "z_^left" ) || "0", 0 );
         var height = scaledInch2Pixel( $this.data( "z_^height" ) || "0", 4 ); // 2*g_pixelsBorder
         var width = scaledInch2Pixel( $this.data( "z_^width" ) || "0", 4 ); // 2*g_pixelsBorder
      // console.log( "Resize Tag: " + $this.attr( "id" ) +
      //                "  Top: " + $this.data( "z_^top" ) + "in ~ " + top + "px" +
      //                "  Left: " + $this.data( "z_^left" ) + "in ~ " + left + "px" +
      //                "  Height: " + $this.data( "z_^height" ) + "in ~ " + height + "px" +
      //                "  Width: " + $this.data( "z_^width" ) ) + "in ~ " + width + "px";
         $this.css({ top: top, left: left, height: height, width: width });
      });
   }

   function scalePixel2Inch( attr, border, message ) {  // "message" for debugging only
      var idx = attr.indexOf( "px" );
      if ( idx >= 0 ) {
         attr = attr.substring( 0, idx );
      }
      var pixels = parseFloat( attr );
      if ( pixels < 0 ) {
         pixels = 0;
      }
      var n = (pixels - border) / (g_pixelsPerInch * g_scale);
      n = n.toFixed( 3 );
   // console.log( "scalePixel2Inch attr: " + attr + "   " + message + ": " + n.toString() + "in" );
      return n;
   }

   function mapElementCssToElementData( $element ) {
   // $item.data( "z_^top", $item.position().top );  these don't have units (e.g. px)
   // $item.data( "z_^left", $item.position().left );
      var id = $element.parent().attr( "id" );
      $element.data( "rparent", id );
      $element.data( "z_^tag", $element.attr( "id" ) );
      // We can only mess with the position/size attributes when on a graphical resize or reposition.  So we cannot
      // set top/left/height/width from the css values when we are only changing which block/panel is being selected.
   // $element.data( "z_^top", scalePixel2Inch( $element.css( "top" ), 0, "top" ) );
   // $element.data( "z_^left", scalePixel2Inch( $element.css( "left" ), 0, "left" ) );
   // $element.data( "z_^height", scalePixel2Inch( $element.css( "height" ), 4, "height" ) ); // 2*g_pixelsBorder
   // $element.data( "z_^width", scalePixel2Inch( $element.css( "width" ), 4, "width" ) ); // 2*g_pixelsBorder
      $element.css({ position: "absolute" });
   // displayElementData( "mapElementCssToElementData: ", $element );
   }

   // <div id="label" name="label" class="label" style="top:0px;left:0px;height:9in;width:8.5in;float:left;position:absolute;">Drop area ...     <!-- without position:relative, target position is off -->
   // <div id="page" name="page" class="page" style="background-color:#f5f5fa;top:0px;left:0px;height:9in;width:8.5in;float:left;position:absolute;">1
   // <div class="block draggable canvas-element block-element ui-draggable ui-resizable" style="position:absolute;top:-0.78125px;height:253px;width:266px;left:0px;background-color: #ccffcc; display: block; float: left; color: red; border: 2px solid;" id="Tag100" name="Tag100">
   // <input type="text" id="zLabelBackgroundColor" name="zLabelBackgroundColor" class="zeidon" data-zmap="label.z_^background^color"  value="#ffffed" />
   function mapUiDataToElementData( $current_element ) {
      if ( g_currentType ) {
         mapToSpecialBlockFromBlock( g_currentType );
         g_currentType = null;
      }
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
                  if ( key === "z_^border^color" || key === "z_^background^color" ) {
                     $current_element.data( key, getColorPickerByRGB( $(this).val() ) );
                  } else {
                     $current_element.data( key, this.type === "checkbox" ? (this.checked === true ? "Y" : "") : $(this).val() );
                  }
               }
            }
         });
      // displayElementData( "mapUiDataToElementData (after)", $current_element );
      }
   }
/*
   function showHideTandem( id, show ) {
      if ( show ) {
         $('#' + id + ', label[for=' + id + ']').show();
      } else {
         $('#' + id + ', label[for=' + id + ']').hide();
      }
   }
*/
   function mapElementDataToUiData( $current_element ) {
      $("#SpecialAttrToggle").hide();
      if ( $current_element ) {
      // displayElementData( "mapElementDataToUiData", $current_element );
         var entityAttr;
         var n;
         var entity;
         var key;
         var value;
         var sectionType;
         var blockName;
         var element_id = $current_element.attr( "id" );
         if ( element_id !== "label" && element_id !== "page" ) {
            element_id = "block";
            sectionType = "";
         }
         $("input.zeidon, select.zeidon").each( function() {
            entityAttr = $(this).data( "zmap" );
            if ( entityAttr ) {
               n = entityAttr.indexOf( ".z_" );
               entity = entityAttr.substring( 0, n );
               if ( entity === element_id ) {
                  key = entityAttr.substring( n + 1 );
                  value = $current_element.data( key );
                  if ( ! value ) {
                     value = "";
                  }
                  if ( key === "z_^l^l^d_^section^type" ) {
                     sectionType = value;
                  } else if ( key === "z_^name" ) {
                     blockName = value;
                  }
                  if ( key === "z_^border^color" || key === "z_^background^color" ) {
                     setColorPickerByName( $(this), value );
                  } else {
                     this.type === "checkbox" ? (value === "Y" ? this.checked = true : this.checked = false) : $(this).val( value );
                  }
               }
            }
         });
         if ( element_id === "block" ) {
         // console.log( "Processing block type: " + sectionType );
            var optionsDflt = "<option value=\"^title\">Title</option><option value=\"^text\">Text</option>";  // default
            var options = "";
            // The .prop() method should be used to set disabled and checked instead of the .attr() method.
            // $('#id').prop('disabled', false);
            // $('#id').prop('disabled', 'disabled');
            if ( sectionType === "Graphic" ) {
               $("#zImageNameToggle").show();
               $("#zCheckContinuationBlockToggle").hide();
            // console.log( "   Hiding capitalize" );
               $("#zCapitalizeTitleTextFlagToggle").hide();
               $("#zClaimListTypeToggle").hide();
               $("#zMarketingSectionToggle").hide();
               options = optionsDflt;
            } else if ( sectionType === "Marketing" ) {
               $("#zCheckContinuationBlockToggle").show();
            // console.log( "   Showing capitalize" );
               $("#zCapitalizeTitleTextFlagToggle").show();
               $("#zImageNameToggle").hide();
               $("#zClaimListTypeToggle").show();
               $("#zMarketingSectionToggle").show();
               $('#zMarketingSection option[value="' + blockName + '"]').prop( 'selected', true );
               // Marketing:  Title / Text / Column List
               options = optionsDflt + "<option value=\"^column ^list\">Column List</option>";
            } else if ( sectionType === "DirectionsForUse" || sectionType === "FirstAid" ||
                        sectionType === "StorageDisposal" || sectionType === "Hazards" || sectionType === "Precautionary" ) {
               $("#zCheckContinuationBlockToggle").show();
            // console.log( "   Showing capitalize" );
               $("#zCapitalizeTitleTextFlagToggle").show();
               $("#zImageNameToggle").hide();
               $("#zClaimListTypeToggle").hide();
               $("#zMarketingSectionToggle").hide();
               options = optionsDflt;
            } else {
               $("#zCheckContinuationBlockToggle").hide();
            // console.log( "   Hiding capitalize" );
               $("#zCapitalizeTitleTextFlagToggle").hide();
               $("#zImageNameToggle").hide();
               $("#zClaimListTypeToggle").hide();
               $("#zMarketingSectionToggle").hide();
               if ( sectionType === "HumanHazard" ) {
                  // Human Hazard:  Hazards Warning / Hazards Signal Word / Hazards Precautionary
                  options = "<option value=\"^hazards ^warning\">Hazards Warning</option><option value=\"^hazards ^signal ^word\">Hazards Signal Word</option><option value=\"^hazards ^precautionary\">Hazards Precautionary</option>";
               } else if ( sectionType === "Ingredients" ) {
                  // Ingredients:   Title / Ingredients Items / Ingredients Inert / Ingredients Total
                  options = "<option value=\"^title\">Title</option><option value=\"^ingredients ^items\">Ingredients Items</option><option value=\"^ingredients ^inert\">Ingredients Inert</option><option value=\"^ingredients ^total\">Ingredients Total</option>";
               } else if ( sectionType === "NetContents" || sectionType === "EPA_RegAndEstNbr" ) {
                  options = "<option value=\"^text\">Text</option>"
               } else {
                  // Default:  Title / Text
                  options = optionsDflt;
               }
            }
            $("#zBlockFormatType")
               .find('option:not(:first)') // wipe out all but the first options
               .remove()
               .end() // terminate the remove - pop up one level of the caller stack (to get to the combobox reference)
               .append(options)
               .val('')
            ;

            if ( $(this).hasClass( "panel" ) ) {
               $("#zBlockFormatTypeToggle").hide();
            } else {
               $("#zBlockFormatTypeToggle").show();
            }
         } else {
            $("#zBlockFormatTypeToggle").hide();
            $("#zCheckContinuationBlockToggle").hide();
         // console.log( "   Hiding capitalize" );
            $("#zCapitalizeTitleTextFlagToggle").hide();
            $("#zImageNameToggle").hide();
            $("#zClaimListTypeToggle").hide();
            $("#zMarketingSectionToggle").hide();
         }
      } else {
         $("input.zeidon, select.zeidonToggle").each( function() {
            this.type === "checkbox" ? this.checked = false : $(this).val( "" );
         });
         $("#zBlockFormatTypeToggle").hide();
         $("#zCheckContinuationBlockToggle").hide();
      // console.log( "   Hiding capitalize" );
         $("#zCapitalizeTitleTextFlagToggle").hide();
         $("#zImageNameToggle").hide();
         $("#zClaimListTypeToggle").hide();
         $("#zMarketingSectionToggle").hide();
      }
   }

/* 1 ELEMENT_NODE
   2 ATTRIBUTE_NODE
   3 TEXT_NODE
   4 CDATA_SECTION_NODE
   5 ENTITY_REFERENCE_NODE
   6 ENTITY_NODE
   7 PROCESSING_INSTRUCTION_NODE
   8 COMMENT_NODE
   9 DOCUMENT_NODE
   10 DOCUMENT_TYPE_NODE
   11 DOCUMENT_FRAGMENT_NODE
   12 NOTATION_NODE
*/
   $("#zBlockTag").blur( function() {
      if ( g_$current_block ) {
         var newText = $(this).val();
         g_$current_block.attr( "id", newText );
         g_$current_block.attr( "name", newText );
      // $current_block.text( newText );  this wipes out all child nodes of the div ... but the complicated next line works where
      // nodeType === 3 restricts this to TEXT_NODE.
         g_$current_block.contents().filter( function() { return this.nodeType === 3; }).replaceWith( newText );
      }
      return false;  // prevent default propagation
   });

   $("div").on( "mousedown", ".block-element", function( event ) {
   // console.log( "mousedown, .block-element" );
      if ( event.button === 0 ) {  // left button
         mapUiDataToElementData( g_$current_block );
         g_$current_block = $(this);
         $("#zBlockTag").val( $(this).attr( "id" ) );
         mapElementDataToUiData( g_$current_block );
         return false;  // prevent default propagation
      }
   });

/*
   $("body").on( "click", "div.ui-draggable", function() {
      mapUiDataToElementData( $current_block );
      $current_block = $(this);
      $("#zBlockTag").val( $(this).attr( "id" ) );
      mapElementDataToUiData( $current_block );
      return false;  // prevent default propagation
   });
*/
   function getBackgroundColorForDepth( depth ) {
      if ( depth <= 0 )
         depth = 1;
      else
      if ( depth > 8 )
         depth = ((depth - 1) % 8) + 1;

      return depth === 1 ? "#fefefe" : depth === 2 ? "#ccffcc" : depth === 3 ? "#ccffff" : depth === 4 ? "#ffccff" : depth === 5 ? "#ccccff" : depth === 6 ? "#ffcccc" : depth === 7 ? "#ffffcc" : "#cccccc";
   }

   function getColorForDepth( depth ) {
      return "#000000";
   /*
      if ( depth <= 0 || depth >= 7  ) {
         depth = 1;
      }

      return depth === 1 ? "red" : depth === 2 ? "brown" : depth === 3 ? "yellow" : depth === 4 ? "green" : depth === 5 ? "blue" : depth === 6 ? "indigo" : "violet";
    */
   }

   function setChildrenDepth( $parent, $child ) {
      var parentDepth = $parent.data( "z_^depth" );
      if ( isNaN( parentDepth ) ) {
         parentDepth = "0";
      }
      var depth = parseInt( parentDepth, 10 ) + 1;
      $child.data( "z_^depth", depth );
      $child.css({
         background: getBackgroundColorForDepth( depth ),
         color: getColorForDepth( depth )
      });

      // get all divs of the child
      $("div").children( ".selected" ).css( "color", "blue" );
      var $children = $child.children();
      var list = $children.map( function() {
         if ( this.nodeName === "DIV" && this.classList.contains( "ui-draggable") === true ) {
            return $(this); //.nodeName + ' ' + this.className + '  id: ' + this.id;
         }
      }).get();
   // displayElementData( "setChildrenDepth (after)", $child );
      for ( var k = 0; k < list.length; k++ ) {
         setChildrenDepth( $child, list[k] );
      }
   }

   function determineTargetOfDrop( event, $parent, $canvasElement ) {
      var clickX = event.pageX;
      var clickY = event.pageY;
      var $list;
      var offset;
      var range;
      var $body = $('body').parents().addBack();
      if ( $canvasElement.hasClass( "panel" ) ) {
         $target = $("#page");
         return $target;
      }

      $list = $('body *').filter( function() {
        offset = $(this).offset();
        range = {
            x: [offset.left, offset.left + $(this).outerWidth()],
            y: [offset.top, offset.top + $(this).outerHeight()]
        };

        return (clickX >= range.x[0] && clickX <= range.x[1]) && (clickY >= range.y[0] && clickY <= range.y[1]);
      });

      $list = $list.add($body);

      var list = $list.map( function() {
         if ( this.nodeName === "DIV" && this.id !== null && this.id !== "label" &&
              this.id !== "zcontainer" && this.id.indexOf( "ui-accordion" ) < 0 &&
              this.classList.contains( "ui-draggable-dragging") === false ) {
            return $(this); //.nodeName + ' ' + this.className + '  id: ' + this.id;
         }
      }).get();

   // console.log( "List: " + list );
      var $target = $parent;
      var ceTop = Math.round( $canvasElement.offset().top );
      var ceLeft = Math.round( $canvasElement.offset().left );
      var ceHeight = Math.round( $canvasElement.height() - g_pixelsBorder ); // account for border
      var ceWidth = Math.round( $canvasElement.width() - g_pixelsBorder ); // account for border
   // var tgtTop = $target.offset().top;
   // var tgtLeft = $target.offset().left;
      var tgtHeight = Math.round( $target.height() );
      var tgtWidth = Math.round( $target.width() );
      var $el;
      var elHeight;
      var elWidth;

      if ( ceTop === 0 && ceLeft === 0 ) {
         ceTop = clickY;
         ceLeft = clickX;
      }

      var contain_list = [];
      var parents = [];
      var k;
      for ( k = 0; k < list.length; k++ ) {
         $el = list[k];
         if ( $el.parents("div#page").length && $el.is(":visible") ) {   // clicked element has div#page as parent
            elHeight = Math.round( $el.height() );
            elWidth = Math.round( $el.width() );

            if ( elHeight < tgtHeight && elWidth < tgtWidth &&  // clicked element is smaller than current target
                 ceTop >= Math.round( $el.offset().top ) && ceLeft >= Math.round( $el.offset().left ) &&  // new element within clicked element boundaries
                 ceTop + ceHeight < Math.round( $el.offset().top ) + elHeight &&
                 ceLeft + ceWidth < Math.round( $el.offset().left ) + elWidth ) {
               contain_list.push( $el );
            }
         }
      }

      // Now look for the "deepest" (childmost) target.
      if ( contain_list.length > 0 ) {
         $target = contain_list[0];
         for ( k = 1; k < contain_list.length; k++ ) {
            $el = contain_list[k];
            parents = $el.parents( "div.canvas-element" );
            if ( $.inArray( $target, parents ) ) {
               $target = $el;
            }
         }
      }
      if ( $canvasElement.hasClass( "reusable" ) ) {
         var stopLoop = 0;
         while ( $target.parent()[0].id !== "label" && stopLoop < 40 ) {
            if ( $target.hasClass( "panel" ) ) {
               break;
            }
            $target = $target.parent();
         }
      }
   // console.log( "Target of drop: " + $target[0].id );
      return $target;
   }

   function getUniqueId() {
      var stopLoop = 0; // prevent infinite loop
      var arr = $(document.getElementById( "Tag" + g_generateTag ));
      do
      {
         if ( $(arr).length <= 0 ) {
            break;
         }

         g_generateTag++;
         arr = $(document.getElementById( "Tag" + g_generateTag ));
      } while ( stopLoop++ < 100 )

      var tag = "Tag" + g_generateTag;
   // console.log( "getUniqueId: " + tag );
      return tag;
   }

   function updatePositionStatus( el, offset_top, offset_left, message ) {
      // ... then update the numbers
      var new_position;
      if ( offset_top === -9999 ) {
         new_position = "";
      } else {
         var x = offset_left / (g_pixelsPerInch * g_scale);
         var y = offset_top / (g_pixelsPerInch * g_scale);
         new_position = "Position: " + y.toFixed( 3 ) + "in, " + x.toFixed( 3 ) + "in";
      }

   // console.log( "UpdatePositionStatus " + message + " (" + offset_top + "," + offset_left + ") : " + new_position );
      $("span#zdisplay_position").text( new_position );
      if ( el ) {
         $("span#zdisplay_tag").text( el.id  );
      } else {
         $("span#zdisplay_tag").text( "" );
      }
   }

   function updateSizeStatus( el, height, width, message ) {
      // ... then update the numbers
      var new_size;
      if ( height === -9999 ) {
         new_size = "";
      } else {
         var x = width / (g_pixelsPerInch * g_scale);
         var y = height / (g_pixelsPerInch * g_scale);
         new_size = "Size: " + y.toFixed( 3 ) + "in, " + x.toFixed( 3 ) + "in";
      }

   // console.log( "UpdateSizeStatus " + message + " (" + height + "," + width + ") : " + new_size );
      $("span#zdisplay_size").text( new_size );
      if ( el ) {
         $("span#zdisplay_tag").text( el.id  );
      } else {
         $("span#zdisplay_tag").text( "" );
      }
   }

   function mapDOM( element, json ) {
      var treeObject = {};

      // If it's a string, convert to a document Node
      if ( typeof element === "string" ) {
         if ( window.DOMParser )
         {
            parser = new DOMParser();
            docNode = parser.parseFromString( element, "text/xml" );
         }
         else // Microsoft strikes again
         {
            docNode = new ActiveXObject( "Microsoft.XMLDOM" );
            docNode.async = false;
            docNode.loadXML( element );
         }
         element = docNode.firstChild;
      }

      // Recursively loop through DOM elements and assign properties to object
      function treeHTML( element, object ) {
         object["type"] = element.nodeName;
         var nodeList = element.childNodes;
         if ( nodeList !== null ) {
            if ( nodeList.length ) {
               object["content"] = [];
               for ( var i = 0; i < nodeList.length; i++ ) {
                  if ( nodeList[i].nodeType === 3 ) {
                     object["content"].push(nodeList[i].value );  // nodeValue);
                  } else {
                     object["content"].push( {} );
                     treeHTML( nodeList[i], object["content"][object["content"].length - 1] );
                  }
               }
            }
         }
         if ( element.attributes != null ) {  // cannot use !== here
            if ( element.attributes.length ) {
               object["attributes"] = {};
               for ( var i = 0; i < element.attributes.length; i++ ) {
                  object["attributes"][element.attributes[i].nodeName] = element.attributes[i].value;  // nodeValue;
               }
            }
         }
      }
      treeHTML(element, treeObject);

      return (json) ? JSON.stringify( treeObject ) : treeObject;
   }

/* not using colorwell at present
   var selected;
   var f = $.farbtastic('#zpicker');
   var p = $('#zpicker').css('opacity', 0.25);
   $('.colorwell')
      .each( function () {
         f.linkTo(this);
         $(this).css('opacity', 0.75);
      })
      .focus( function() {
         if (selected) {
            $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
         }
         f.linkTo(this);
         p.css('opacity', 1);
         $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });
*/
   function fbCallback( color ) {
      alert( "fbCallback color: " + color );
   }

   $("#jQueryRequired").hide();

   $("#zBlockViewName").mousedown( function() {
     alert("The zBlockViewName was clicked.");
   });
         // using default options
    /*   $("#ftree").fancytree({
            source: {url: "ajax-tree-decide.json"}
         });

    $("#treegrid").fancytree({
      extensions: ["table"],
      checkbox: true,
      table: {
        indentation: 20,      // indent 20px per node level
        nodeColumnIdx: 2,     // render the node title into the 2nd column
        checkboxColumnIdx: 0  // render the checkboxes into the 1st column
      },
      source: {
        url: "../demo/ajax-tree-plain.json"
      },
      lazyload: function(e, data) {
        data.result = {url: "../demo/ajax-sub2.json"}
      },
      renderColumns: function(e, data) {
        var node = data.node,
          $tdList = $(node.tr).find(">td");
        // (index #0 is rendered by fancytree by adding the checkbox)
        $tdList.eq(1).text(node.getIndexHier()).addClass("alignRight");
        // (index #2 is rendered by fancytree)
        $tdList.eq(3).text(node.key);
        $tdList.eq(4).html("<input type='checkbox' name='like' value='" + node.key + "'>");
      }
    });


    // Attach the dynatree widget to an existing <div id="tree"> element
    // and pass the tree options as an argument to the dynatree() function:
    $("#dtree").dynatree({
      onActivate: function(node) {
        // A DynaTreeNode object is passed to the activation handler
        // Note: we also get this event, if persistence is on, and the page is reloaded.
        alert("You activated " + node.data.title);
      },
      children: [
        {title: "Item 1"},
        {title: "Folder 2", isFolder: true, key: "folder2",
          children: [
            {title: "Sub-item 2.1"},
            {title: "Sub-item 2.2"}
          ]
        },
        {title: "Item 3"}
      ]
    });
*/


// $("#zBlockBackgroundColor").attr( "readonly", true ); data???
/* not using colorwell at present
   var selectedBlock;
   var fBlock = $.farbtastic( "#zBlockPicker", fbCallback );
   var pBlock = $("#zBlockPicker").css("opacity", 0.25).hide();
   $("input.colorwell1")
      .each( function() {
         fBlock.linkTo(this);
         $(this).css( "opacity", 0.75 );
      })
      .blur( function() {
         pBlock.css( "opacity", 0.25 );
         pBlock.hide();
      })
      .focus( function() {
         if ( selectedBlock ) {
            $(selectedBlock).css( "opacity", 0.75 ).removeClass( "colorwell-selected" );
         }
         fBlock.linkTo( this );
         pBlock.css( "opacity", 1 );
         pBlock.fadeIn();
         $(selectedBlock = this).css( "opacity", 1 ).addClass( "colorwell-selected" );
      });

   var selectedLabel;
// $("#zLabelBackgroundColor").attr( "readonly", true ); data???
//xvar fLLD = $.farbtastic( "#zLabelPicker", fbCallback );
//xvar pLLD = $("#zLabelPicker").css("opacity", 0.25).hide();
   $("input.colorwell2")
      .each( function() {
         fLLD.linkTo(this); $(this).css( "opacity", 0.75 );
      })
      .blur( function() {
         pLLD.css( "opacity", 0.25 );
         pLLD.hide();
      })
      .focus( function() {
         if ( selectedLabel ) {
            $(selectedLabel).css( "opacity", 0.75 ).removeClass( "colorwell-selected" );
         }
         fLLD.linkTo( this );
         pLLD.css( "opacity", 1 );
         pLLD.fadeIn();
         $(selectedLabel = this).css( "opacity", 1 ).addClass( "colorwell-selected" );
      });
*/
   $("#zBlockTop")
      .blur( function () {
         var top = pixel2Scale( inch2px( $(this).val(), 0 ) );
      // console.log( "block top attribute: " + $(this).val() + " ==> " + top );
         top = scaledInch2Pixel( $(this).val(), 0 );
      // console.log( "scaled block top attribute: " + $(this).val() + " ==> " + top );
          g_$current_block.css({ top : top });
      });
   
   $("#zBlockLeft")
      .blur( function () {
         var left = pixel2Scale( inch2px( $(this).val(), 0 ) );
      // console.log( "block left attribute: " + $(this).val() + " ==> " + left );
         left = scaledInch2Pixel( $(this).val(), 0 );
      // console.log( "scaled block left attribute: " + $(this).val() + " ==> " + left );
         g_$current_block.css({ left : left });
      });
   
   $("#zBlockHeight")
      .blur( function () {
         var height = pixel2Scale( inch2px( $(this).val(), 4 ) ); // 2*g_pixelsBorder
      // console.log( "block height attribute: " + $(this).val() + " ==> " + height );
         height = scaledInch2Pixel( $(this).val(), 0 );
      // console.log( "scaled block height attribute: " + $(this).val() + " ==> " + height );
         g_$current_block.css({ height : height });
      });
   
   $("#zBlockWidth")
      .blur( function () {
         var width = pixel2Scale( inch2px( $(this).val(), 4 ) ); // 2*g_pixelsBorder
         // console.log( "block width attribute: " + $(this).val() + " ==> " + width );
         width = scaledInch2Pixel( $(this).val(), 0 );
         // console.log( "scaled block width attribute: " + $(this).val() + " ==> " + width );
         g_$current_block.css({ width : width });
      });

   function blurZeidon( el, value ) {
      // console.log( "updated zeidon block attributes" );
      // var jsonObj = null;
      var $el = $(el);
      var entityAttr = $el.data( "zmap" );
      if ( entityAttr ) {
         var n = entityAttr.indexOf( ".z_" );
         var entity = entityAttr.substring( 0, n );
         var key = entityAttr.substring( n + 1 );
         if ( ! value ) {
            value = $el.is( ":checkbox" ) ? el.checked ? "Y" : "N" : $el.val();
         }
         if ( entity === "block" ) {
            if ( g_$current_block ) {
               g_updatedLLD = true;
               // console.log( "updated block attribute: " + key + "  value: " + value );
               g_$current_block.data( key, value );
            }
            // jsonObj = dataToJSON( $current_block );
         } else if ( entity === "page" ) {
            g_updatedLLD = true;
            // console.log( "updated page attribute: " + key + "  value: " + value );
            $("#page").data( key, value );
            // jsonObj = dataToJSON( $("#page") );
         } else if ( entity === "label" ) {
            g_updatedLLD = true;
            // console.log( "updated label attribute: " + key + "  value: " + value );
            $("#label").data( key, value );
         }
      }
      // displayElementData( "zeidon blur (after)", $el );
   }
/*
   $("div.colorPicker-picker")
      .blur( function () {
         $(this).siblings( "input.zeidon-special").each( function() {
            blurZeidon( this, null );
         });
      });
*/
   
   $("input.zeidon, select.zeidon, input.zeidon-special, select.zeidon-special")
      .change( function(e) {
         e.stopPropagation();
         return false;
      // return true;
      // alert( "Handler for .change() called." );
      })
      .blur( function () {
         blurZeidon( this, null );
         if ( this === $("#zPageHeight")[0] || this === $("#zPageWidth")[0] ) {
            setPageBackgroundSize();
         }
      });

var g_BlockAttrList = [ "z_^text^color", "z_^text^color^override",
                        "z_^font^family", "z_^font^size", "z_^font^weight",
                        "z_^margin", "z_^margin^top", "z_^margin^left", "z_^margin^bottom", "z_^margin^right", "z_^margin^override",
                        "z_^border", "z_^border^top", "z_^border^bottom", "z_^border^left", "z_^borderRight", "z_^border^override",
                        "z_^padding", "z_^padding^top", "z_^padding^bottom", "z_^padding^left", "z_^padding^right", "z_^padding^override",
                        "z_^title^position", "z_^text^align", "z_^text^line^height", "z_^text^letter^space" ];

   function mapToSpecialBlockFromBlock( currentType ) {
      if ( g_$current_block && g_$current_block.data() ) {
         var sectionType = g_$current_block.data( "z_^l^l^d_^section^type" );
         if ( sectionType ) {
         // displayElementData( "mapToSpecialBlockFromBlock Before", g_$current_block );
            
            var entityAttr;
            var n;
            var entity;
            var key;

            $("input.zeidon-special, select.zeidon-special").each( function() {
               entityAttr = $(this).data( "zmap" );
               if ( entityAttr ) {
                  n = entityAttr.indexOf( ".z_" );
                  entity = entityAttr.substring( 0, n );
                  if ( entity === "block" ) {
                     key = entityAttr.substring( n + 1 );
                     if ( key === "z_^text^color" ) {
                     // console.log( "Processing color1" );
                        g_$current_block.data( key, getColorPickerByRGB( $(this).val() ) );
                     } else {
                        g_$current_block.data( key, this.type === "checkbox" ? (this.checked === true ? "Y" : "") : $(this).val() );
                     }
                  }
               }
            });
            
            var section = zeidonAttributeToKey( sectionType ) + "." + currentType + ".";
            $.each( g_BlockAttrList, function( index, attributeName ) {
               var specialBlockAttribute = section + attributeName;
            // console.log( "ToSpecial: " + attributeName + "  to: " + specialBlockAttribute + "  current: " + g_$current_block.data( attributeName ) );
               g_$current_block.data( specialBlockAttribute, g_$current_block.data( attributeName ) ); 
               g_$current_block.data( attributeName, "" );
            });
         // displayElementData( "mapToSpecialBlockFromBlock After", g_$current_block );
         }
      }
   }

   // Process data of the form: z_^marketing.^text.^font^family : verdana
   function mapFromSpecialBlockToBlock( currentType ) {
      if ( g_$current_block && g_$current_block.data() ) {
         var sectionType = g_$current_block.data( "z_^l^l^d_^section^type" );
         if ( sectionType ) {
         // displayElementData( "Before mapFromSpecialBlockToBlock", g_$current_block );
            var section = zeidonAttributeToKey( sectionType ) + "." + currentType + ".";
            $.each( g_BlockAttrList, function( index, attributeName ) {
               var specialBlockAttribute = section + attributeName;
            // console.log( "FromSpecial: " + attributeName + "  from: " + specialBlockAttribute + "  current: " + g_$current_block.data( specialBlockAttribute ) );
               g_$current_block.data( attributeName, g_$current_block.data( specialBlockAttribute ) ); 
               g_$current_block.data( specialBlockAttribute, "" );
            });

            var entityAttr;
            var n;
            var entity;
            var key;
            var value;
            $("input.zeidon-special, select.zeidon-special").each( function() {
               entityAttr = $(this).data( "zmap" );
               if ( entityAttr ) {
                  n = entityAttr.indexOf( ".z_" );
                  entity = entityAttr.substring( 0, n );
                  if ( entity === "block" ) {
                     key = entityAttr.substring( n + 1 );
                     value = g_$current_block.data( key );
                     if ( ! value ) {
                        value = "";
                     }
                     if ( key === "z_^text^color" ) {
                        setColorPickerByName( $(this), value );
                     } else {
                        this.type === "checkbox" ? (value === "Y" ? this.checked = true : this.checked = false) : $(this).val( value );
                     }
                  }
               }
            });

         // displayElementData( "After mapFromSpecialBlockToBlock", g_$current_block );
         }
      }
   }

   $("#zBlockFormatType")
      .change( function() {
         if ( g_currentType ) {
            mapToSpecialBlockFromBlock( g_currentType );
            g_currentType = null;
         }
         var val = $(this).val();
         if ( val === "" ) {
            g_currentType = null;
            $("#SpecialAttrToggle").hide(200);
         } else {
            g_currentType = val;
            mapFromSpecialBlockToBlock( g_currentType );
            $("#SpecialAttrToggle").show(400);
         }
      });

   $("#zMarketingSection")
      .change( function() {
         var val = $(this).val();
         $("#zBlockName").val( val );

      // alert( "Selected value: " + val );
      // g_$current_block.text( $('#zSectionType').val() );  this wipes out all child nodes of the div ... but the complicated next line works where
      // nodeType === 3 restricts this to TEXT_NODE.
         g_$current_block.contents().filter( function() { return this.nodeType === 3; }).replaceWith( "Marketing: " + val );
      });

   $("#zSectionType")
      .change( function() {
         var val = $(this).val();
         if ( val === "" ) {
            val = "?";
         } else if ( val === "Marketing" ) {
            val += ": " + g_$current_block.data( "z_^name" );
         } else if ( val === "Graphic" ) {
            // div { background: url(img_flwr.gif); background-size: 80px 60px; background-repeat: no-repeat;
         // var height = g_$current_block.height();
         // var width = g_$current_block.width();
            var graphic = g_$current_block.data( "z_^image^name" );
            val += ": " + graphic;
         // val = "<div style=\"text-align: center;\"><IMG height=" + height + " width=" + width + " SRC=\"./images/" + graphic + "\" ALT=\"" + val + "\"></div>";
         }
      // alert( "Selected value: " + val );
      // g_$current_block.text( $('#zSectionType').val() );  this wipes out all child nodes of the div ... but the complicated next line works where
      // nodeType === 3 restricts this to TEXT_NODE.
         g_$current_block.contents().filter( function() { return this.nodeType === 3; }).replaceWith( val );
      });

// $("#label").niceScroll({touchbehavior:false,cursorcolor:"#00F",cursoropacitymax:0.7,cursorwidth:6,background:"#ccc",autohidemode:false});
   function runSlideToolsEffect( show ) {
      // run the effect
      var options = { direction : "down" };
      if ( show ) {
         $("#zmenu").show( "slide", options, 125 );
      } else {
         $("#zmenu").hide( "slide", options, 125 );
      }
   }

   $("#labelBorders")
      .change( function() {
         if ( $(this).is( ":checked" ) ) {
            localStorage.setItem( "epamms_graphic_labelborders", "Y" );
         } else {
            localStorage.setItem( "epamms_graphic_labelborders", "N" );
         }
      });

   $("#showtools")
      .change( function() {
         var left = $(window).width() - $("#zmenu").width() - (4 * g_scrollbar.width) - 2;
         $("#zmenu").css({ left: left, height: $("#label").height() - g_scrollbar.height });

         if ( $(this).is( ":checked" ) ) {
            localStorage.setItem( "epamms_graphic_showtools", "Y" );
            runSlideToolsEffect( true );
         } else {
            localStorage.setItem( "epamms_graphic_showtools", "N" );
            runSlideToolsEffect( false );
         }
      });

// $("#zBlockTextAlign").combobox();
// $("#zHazardPanel").combobox();

   var $FontSizeSpinner = $("#zFontSizeSpinner").spinner();
   $FontSizeSpinner.spinner( "option", "min", 6 );
   $FontSizeSpinner.spinner( "option", "max", 40 );
   $FontSizeSpinner.spinner( "option", "numberFormat", "nn" );
   $FontSizeSpinner[0].readOnly = true;  // prevent invalid input

   $("#zFontSizeClear").click( function() {
      $FontSizeSpinner.spinner( "value", null );
   });

   // Handle the Spinner change event.
   $FontSizeSpinner.on( "spinstop", function( event, ui ) {
      blurZeidon( this, $FontSizeSpinner.spinner( "value" ) );
   });

   function selectPage( value ) {
      mapUiDataToElementData( $("#page") );
      $("#page").attr( "id", "page" + g_currentPage ).attr( "name", "page" + g_currentPage ).removeClass( "page_active" ).addClass( "page_hidden" ).hide();
      $("#page" + value).attr( "id", "page" ).attr( "name", "page" ).removeClass( "page_hidden" ).addClass( "page_active" ).show();
      g_currentPage = value;
      mapElementDataToUiData( $("#page") );
      setPageBackgroundSize();
   }

   function setPageBackgroundSize() {
      var $page = $("#page");
      var height = $page.data( "z_^height" ); // convert inches to px
      var h = scaledInch2Pixel( height, 0 );
      var width = $page.data( "z_^width" ); // convert inches to px
      var w = scaledInch2Pixel( width, 0 );
      $page.height( h ).width( w );
   }

   var $PageSpinner = $("#zPageSpinner").spinner();
   $PageSpinner.spinner( "option", "min", 1 );
   $PageSpinner.spinner( "option", "max", 9 );
   $PageSpinner.spinner( "option", "numberFormat", "nn" );
   $PageSpinner[0].readOnly = true;  // prevent invalid input

   // Handle the Spinner change event.
   $PageSpinner.on( "spinstop", function( event, ui ) {
      selectPage( $PageSpinner.spinner( "value" ) );
   });

   var $SnapSpinnerX = $("#SnapSpinnerX").spinner();
   $SnapSpinnerX.spinner( "option", "min", 0.01 );
   $SnapSpinnerX.spinner( "option", "max", 1.00 );
   $SnapSpinnerX.spinner( "option", "step", 0.01 );
   $SnapSpinnerX.spinner( "option", "page", 0.10 );
   $SnapSpinnerX.spinner( "option", "numberFormat", "n.nn" );
   $SnapSpinnerX[0].readOnly = true;  // prevent invalid input

   // Handle the Spinner change event.
   $SnapSpinnerX.on( "spinstop", function( event, ui ) {
      g_currentSnapX = ($SnapSpinnerX.spinner( "value" ) * 100).toString();
   });

   var $SnapSpinnerY = $("#SnapSpinnerY").spinner();
   $SnapSpinnerY.spinner( "option", "min", 0.01 );
   $SnapSpinnerY.spinner( "option", "max", 1.00 );
   $SnapSpinnerY.spinner( "option", "step", 0.01 );
   $SnapSpinnerY.spinner( "option", "page", 0.10 );
   $SnapSpinnerY.spinner( "option", "numberFormat", "n.nn" );
   $SnapSpinnerY[0].readOnly = true;  // prevent invalid input

   // Handle the Spinner change event.
   $SnapSpinnerY.on( "spinstop", function( event, ui ) {
      g_currentSnapY = ($SnapSpinnerY.spinner( "value" ) * 100).toString();
   });

//x$( function() {
   //x $("#zPageUnits").buttonset();
//x});

// $("#zPageUnits").buttonset().find("label").css({ width: "50%" });
//x$("#zPageUnits").buttonset().find('label').css({ 'width': '40px', 'height': '24px'});

//x$( function() {
   //x $("#zBlockUnits").buttonset();
//x});

// $("#zBlockUnits").buttonset().find("label").css({ width: "50%" });
//x $("#zBlockUnits").buttonset().find('label').css({ 'width': '40px', 'height': '24px'});

// $( function() {
//    $("#zcheckContinuationBlock").button();
//  });

// var req = null;
   var isIE = false;

   function initRequest() {
      if ( window.XMLHttpRequest ) {
         if ( navigator.userAgent.indexOf('MSIE') !== -1 ) {
            isIE = true;
         }
         return new XMLHttpRequest();
      } else if ( window.ActiveXObject ) {
         isIE = true;
         return new ActiveXObject( "Microsoft.XMLHTTP" );
      }
   }

// ReadyState  Holds the status of the XMLHttpRequest. Changes from 0 to 4:
//  - 0: request not initialized
//  - 1: server connection established
//  - 2: request received
//  - 3: processing request
//  - 4: request finished and response is ready
// status - 200: "OK"
//        - 404: Page not found
/* function FormatToJsonLLD_Callback() {
      if ( req.readyState === 4 ) {
         if ( req.status === 200 ) {
         // parseMessages( req.responseXML );
         // $id("zFormattedJsonLabel").innerHTML = g_jsonLabel;
            alert( "Accept: " + req.responseText );
         }
      }
   }
*/
   // jQuery.post( url [, data ] [, success(data, textStatus, jqXHR) ] [, dataType ] )  Returns: jqXHR
   // Additional parameters:
   //   data - contains the resulting data from the request
   //   status - contains the status of the request ("success", "notmodified", "error", "timeout", or "parsererror")
   //   xhr - contains the XMLHttpRequest object

   function GetCurrentLabel() {
      $("#page").attr( "id", "page" + g_currentPage ).attr( "name", "page" + g_currentPage );
      var $initElement = $("#label");
      var jsonDOM = mapDOM( $initElement[0], true );
   // console.log( "JSON DOM: " + jsonDOM );
      var jsonLabel = CaptureZeidonLabelJsonFromDomJson( jsonDOM );
      $("#page" + g_currentPage).attr( "id", "page" );
      return jsonLabel;
   }

function ConvertWysiwygLabelDesignToZeidonJson( action, viewName, callback_func, $block, jsonString ) {
   var reuseBlockName = "";
   var tag = "";
   if ( $block ) {
      tag = $block.data( "z_^tag" );
   }
   if ( action === "saveReusableBlock" ) {
      reuseBlockName = prompt( "Please enter the reusable block name", tag );
      if ( reuseBlockName === "" ) {
         return;
      }
      if ( $("#zReusableBlocks option[value='" + reuseBlockName + "']").length > 0 ) {
         if ( confirm( "Do you want to replace the current reusable block: " + reuseBlockName ) === false ) {
            return;
         }
      }
   } else if ( action === "applyReusableBlock" ) {
      reuseBlockName = $("#zReusableBlocks").val();  
   }
   var jsonLabel = GetCurrentLabel();
   if ( jsonString === null ) {
      jsonString = "{}";
   }
   // Display the resultant JSON that will be passed to Zeidon to be saved as an LLD.
   // console.log( "\nJsonLabel: " + jsonLabel );

     // The jqXHR.success(), jqXHR.error(), and jqXHR.complete() callback methods introduced in jQuery 1.5
     // are deprecated as of jQuery 1.8. Use jqXHR.done(), jqXHR.fail(), and jqXHR.always() instead.
      try {
         // Assign handlers immediately after making the request and remember the jqxhr object for this request
         // Retrieve the JSON version of the label from Zeidon (on the server) in a saved LLD.
         var url = "labeldesigner?action=" + action + "&viewName=" + escape( viewName ) + "&blockTag=" + escape( tag ) + "&blockName=" + escape( reuseBlockName ) + "&parms=" + escape( jsonString );
         $.ajax({ url: url,
                  type: "post", // string defining the HTTP method to use for the request: GET (default) or POST
                  contentType: "application/json; charset=utf-8",
                  dataType: "json", // defines the type of data expected back from the server (xml, html, json, or script)
                  processData: true, // boolean (default:true) indicating whether to convert the submitted data from an object form into a query-string form
                  data: jsonLabel,
               // beforeSend - callback function that is executed before the request is sent
                  success: function( data, textStatus, jqXHR ) {
                           // console.log( "ConvertWysiwygLabelDesignToZeidonJson: success status: " + textStatus );
                              if ( callback_func ) {
                                 callback_func( $block );
                              }
                           },
                  error:   function( jqXHR, textStatus, errorThrown ) {
                              console.log( "ConvertWysiwygLabelDesignToZeidonJson: error xhr response: " + jqXHR.responseText + "  status: " + textStatus + "  error: " + errorThrown );
                           },
                  complete: function( jqXHR, textStatus ) { // callback function that executes whenever the request finishes
                           // console.log( "ConvertWysiwygLabelDesignToZeidonJson: complete status: " + textStatus + "  response: " + jqXHR.responseText );
                           }
         });
      } catch(e) {
         alert( "Could not load OI: " + viewName + "\n" + e.message );
      } finally { // TODO:  this should not be done here ... it happens way too early ... the success/error/complete function? should do it 
         g_$current_block = null;

         // TODO: display the label/page/block properties
      }
   }

   var $ZoomSpinner = $("#zZoomSpinner").spinner();
   $ZoomSpinner.spinner( "option", "min", 0.2 );
   $ZoomSpinner.spinner( "option", "max", 2.0 );
   $ZoomSpinner.spinner( "option", "step", 0.1 );
   $ZoomSpinner.spinner( "option", "page", 0.5 );
   $ZoomSpinner.spinner( "option", "numberFormat", "n.n" );
   $ZoomSpinner[0].readOnly = true;  // prevent invalid input
 
    // Handle the Spinner change event.
   $ZoomSpinner.on( "spinstop", function( event, ui ) {
      g_scale = $ZoomSpinner.spinner( "value" );
      localStorage.setItem( "epamms_graphic_spinstop", g_scale  );
      resizeImg();
   });

/* FTP Client

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class FileClient {
    public static void main(String[] args) throws Exception {

        long start = System.currentTimeMillis();

        // localhost for testing
        Socket sock = new Socket("127.0.0.1", 13267);
        System.out.println("Connecting...");
        InputStream is = sock.getInputStream();
        // receive file
        new FileClient().receiveFile(is);
        OutputStream os = sock.getOutputStream();
        //new FileClient().send(os);
        long end = System.currentTimeMillis();
        System.out.println(end - start);

        sock.close();
    }


    public void send(OutputStream os) throws Exception {
        // sendfile
        File myFile = new File("/home/nilesh/opt/eclipse/about.html");
        byte[] mybytearray = new byte[(int) myFile.length() + 1];
        FileInputStream fis = new FileInputStream(myFile);
        BufferedInputStream bis = new BufferedInputStream(fis);
        bis.read(mybytearray, 0, mybytearray.length);
        System.out.println("Sending...");
        os.write(mybytearray, 0, mybytearray.length);
        os.flush();
    }

    public void receiveFile(InputStream is) throws Exception {
        int filesize = 6022386;
        int bytesRead;
        int current = 0;
        byte[] mybytearray = new byte[filesize];

        FileOutputStream fos = new FileOutputStream("def");
        BufferedOutputStream bos = new BufferedOutputStream(fos);
        bytesRead = is.read(mybytearray, 0, mybytearray.length);
        current = bytesRead;

        do {
            bytesRead = is.read(mybytearray, current,
                    (mybytearray.length - current));
            if (bytesRead >= 0)
                current += bytesRead;
        } while (bytesRead > -1);

        bos.write(mybytearray, 0, current);
        bos.flush();
        bos.close();
    }
} 
*/

/* FTP Server

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class FileServer {
    public static void main(String[] args) throws Exception {
        // create socket
        ServerSocket servsock = new ServerSocket(13267);
        while (true) {
            System.out.println("Waiting...");

            Socket sock = servsock.accept();
            System.out.println("Accepted connection : " + sock);
            OutputStream os = sock.getOutputStream();
            //new FileServer().send(os);
            InputStream is = sock.getInputStream();
            new FileServer().receiveFile(is);
            sock.close();
        }
    }

    public void send(OutputStream os) throws Exception {
        // sendfile
        File myFile = new File("/home/nilesh/opt/eclipse/about.html");
        byte[] mybytearray = new byte[(int) myFile.length() + 1];
        FileInputStream fis = new FileInputStream(myFile);
        BufferedInputStream bis = new BufferedInputStream(fis);
        bis.read(mybytearray, 0, mybytearray.length);
        System.out.println("Sending...");
        os.write(mybytearray, 0, mybytearray.length);
        os.flush();
    }

    public void receiveFile(InputStream is) throws Exception {
        int filesize = 6022386;
        int bytesRead;
        int current = 0;
        byte[] mybytearray = new byte[filesize];

        FileOutputStream fos = new FileOutputStream("def");
        BufferedOutputStream bos = new BufferedOutputStream(fos);
        bytesRead = is.read(mybytearray, 0, mybytearray.length);
        current = bytesRead;

        do {
            bytesRead = is.read(mybytearray, current,
                    (mybytearray.length - current));
            if (bytesRead >= 0)
                current += bytesRead;
        } while (bytesRead > -1);

        bos.write(mybytearray, 0, current);
        bos.flush();
        bos.close();
    }
} 
*/
   function CaptureZeidonLabelJsonFromDomJson( jsonDom ) {
   // var jsonObj = eval( "[" + json + "]" );
   // console.log( "Dom: " + jsonDom );
      var jsonObj = g_ViewNameMap.getViewByName( "LLD_Dom" );
      if ( jsonObj != null ) {
         g_ViewNameMap.dropNameForView( jsonObj, "LLD_Dom" );
      }
      jsonObj = g_ViewNameMap.getViewByName( "LLD_New" );
      if ( jsonObj != null ) {
         g_ViewNameMap.dropNameForView( jsonObj, "LLD_New" );
      }

      jsonObj = jsonStringToJsonObject( jsonDom );
      g_ViewNameMap.setNameForView( jsonObj, "LLD_Dom" );
   // var formattedHtml = renderJsonObjectAsFormattedHtml( jsonObj[0], 0, false, false, false );
   // $id("zFormattedJsonLabel").innerHTML = "<PRE class='CodeContainer'>" + formattedHtml + "</PRE>";

   // once is enough (above)? jsonObj = jsonStringToJsonObject( jsonDom );
      var jsonLabel = "{ \".meta\" : { \"version\" : \"" + g_metaVersion + "\", \"date\" : \"" + g_metaDate +
              "\" }, \"OIs\" : [ { \".oimeta\" : { \"application\" : \"" + g_application + "\", \"odName\" : \"mSPLDef\", \"incremental\" : \"true\" }";
      var firstBlock = new Object();
      firstBlock.isFirst = true;
      jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, jsonObj[0], false, false, false, firstBlock );
      jsonLabel += "} ] }";
      try {
         jsonObj = jsonStringToJsonObject( jsonLabel );
      } catch (e) {
         console.log( "JSON Label: " + jsonLabel );
         alert( "Generated JSON Label is not well formatted:\n" + e.message );
         jsonObj = null;
         jsonLabel = "";
      } finally {
         if ( jsonObj ) { 
            g_ViewNameMap.setNameForView( jsonObj, "LLD_New" );
         } else {
         // g_ViewNameMap.dropNameForView( jsonObj, "LLD_New" );
         }
         return jsonLabel;
      }
   }

   function CheckIfLastSibling( parentArray, parentIdx, className ) {
      var objType;
      if ( parentArray !== null && parentIdx >= 0 ) {
         while ( parentIdx < parentArray.length ) {
            objType = typeof parentArray[parentIdx];
            if ( objType === 'object' ) {
               var obj = parentArray[parentIdx];
               var numProps = 0;
               var type = false;
               var content = false;
               var attributes = false;
               for ( var prop in obj ) {
                  if ( prop === "type" ) {
                     if ( obj[prop] !== "DIV" ) {
                        numProps = 0;
                        break;
                     }
                     type = true;
                  } else
                  if ( prop === "content" ) {
                     content = true;
                  } else
                  if ( prop === "attributes" ) {
                     attributes = true;
                  }
                  numProps++;
               }

               var skip = type && content && attributes;
               if ( skip && numProps > 0 ) {  // it's a DIV
                  // get the class
                  var classlist = obj["attributes"]["class"];
                  if ( classlist && classlist.indexOf( className ) >= 0 ) {
                     return false;
                  }
               }
            }

            parentIdx++;
         }
      }

      return true;
   }

   function elementDataToJSON( id ) {
      var $element = $("#" + id);
      var json = "";
      if ( $element ) {
         $.each( $element.data(), function( key, value ) {
            if ( key.indexOf( "z_" ) === 0 && (typeof value === "string" || typeof value === "number") ) {
               var zeidonAttribute = keyToZeidonAttribute( key.substring( 2 ) );
               json += ", \"" + zeidonAttribute + "\" : \"" + value + "\"";
            }
         });
      }

      return json;
   }

   function quoteLiteral( literal, quote, comma ) {
      return quote + literal + quote + comma;
   }

/*
  ".meta" : {
    "version" : "1.0",
    "date" : "2014-08-29T15:50:33.897"
  },
  "OIs" : [ {
    ".oimeta" : {
      "application" : "epamms",
      "odName" : "mSPLDef",
      "incremental" : true
    },
*/
   var blockRecurse = 1;
// var entityIdx = -1;
   var recurse = -1;
   var pageNbr = 0;
   var firstPage = true;
   var lastPage = false;
   var firstPanel = true;
   var lastPanel = false;

   function TranslateWysiwygDesignToJsonLabel( parentArray, parentIdx, obj, addComma, isArray, isPropertyContent, firstBlockIn ) {
      var jsonLabel = "";
      var comma = (addComma) ? ", " : "";
      var objType = typeof obj;
      recurse++;
      var firstBlock = new Object();
      firstBlock.isFirst = firstBlockIn.isFirst;
      if ( $.isArray( obj ) ) {
         if ( obj.length === 0 ) {
         // json += "[ ]" + comma;
         } else {
         // json += "[";
             for ( var k = 0; k < obj.length; k++ ) {
               if ( obj[k] && typeof obj[k] !== "string" ) {
                  jsonLabel += TranslateWysiwygDesignToJsonLabel( obj, k + 1, obj[k], k < (obj.length - 1), true, false, firstBlock );
               }
            }
         }
      // json += "], " + comma;
      } else if ( objType === 'object' ) {
         if ( obj ) {
            var numProps = 0;
            var type = false;
            var content = false;
            var attributes = false;
            for ( var prop in obj ) {
            // console.log( obj[prop] );
               if ( prop === "type" ) {
                  if ( obj[prop] !== "DIV" ) {
                     numProps = 0;
                     break;
                  }
                  type = true;
               }
               else
               if ( prop === "content" ) {
                  content = true;
               }
               else
               if ( prop === "attributes" ) {
                  attributes = true;
               }
               numProps++;
            }
            if ( numProps === 0 ) {
            // json += comma;
            } else {
               var skip = type && content && attributes;
               if ( skip ) {  // it's a DIV
                  // get the class
                  var classlist = obj["attributes"]["class"];
                  var text;
                  if ( typeof obj["content"][0] === "string" ) {
                     text = stripTrailingWhiteSpace( obj["content"][0] );
                  }
                  else {
                     text = "";
                  }
                  // Anytime you start a new entity you need a comma, no matter what the
                  // previous "thing" was.  At the end of every entity, "} ]" is required,
                  // unless it is a sibling entity of the same name.  In that case, we
                  // want to skip the "} ]" and the entity name and " : [".
                  if ( classlist ) {
                     var isLabel = false;  // there is only one label
                     var isPage = false;   // there are pages at only depth zero
                     var isPanel = false;  // there are panels at only depth one
                     var isBlock = false;
                     var lastBlock = true;
                     if ( classlist.indexOf( "label" ) >= 0 ) {
                        if ( isLabel ) {
                           alert( "The JSON object contains multiple label entities" );
                           throw new Error( "The JSON object contains multiple label entities" );
                        }
                        isLabel = true;
                     // entityIdx = -1;
                        pageNbr = 0;
                        firstPage = true; // pages do not recurse
                        lastPage = false;
                        jsonLabel += ", \n\"SPLD_LLD\" : [ { \".meta\" : { \"created\" : \"true\" }, \"Name\" : \"" + text + "\" ";
                        jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock );
                     } else if ( classlist.indexOf( "page" ) >= 0 ) {
                        pageNbr++;
                        isPage = true;
                        firstPanel = true; // panels do not recurse
                        lastPanel = false;
                     // entityIdx = 0;
                        if ( firstPage ) {
                           jsonLabel += ", \n\"LLD_Page\" : [ { \".meta\" : { \"created\" : \"true\" } ";
                           firstPage = false;
                        } else {
                           jsonLabel += "}, \n{ \".meta\" : { \"created\" : \"true\" } ";
                        }
                        jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock );
                        lastPage = CheckIfLastSibling( parentArray, parentIdx, "page" );
                     } else if ( classlist.indexOf( "panel" ) >= 0 ) {
                        isPanel = true;
                     // entityIdx = 0;
                        blockRecurse = 1;
                        firstBlock.isFirst = true; // blocks do recurse
                        if ( firstPanel ) {
                           jsonLabel += ", \n\"LLD_Panel\" : [ { \".meta\" : { \"created\" : \"true\" } ";
                           firstPanel = false;
                        } else {
                           jsonLabel += "}, \n{ \".meta\" : { \"created\" : \"true\" } ";
                        }
                        jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock );
                        lastPanel = CheckIfLastSibling( parentArray, parentIdx, "panel" );
                     } else if ( classlist.indexOf( "block" ) >= 0 ) {
                        var idTag = obj["attributes"]["id"];
                     // if ( idTag === "Tag102" || idTag === "876" ) {
                     //    console.log( "idTag: " + idTag );
                     // }
                        var $element = $("#" + idTag);
                        var blockDepth = parseInt( $element.data( "z_^depth" ) );
                        isBlock = true;
                        if ( firstBlock.isFirst || blockDepth > blockRecurse ) {
                           blockRecurse = blockDepth;
                           firstBlock.isFirst = false;
                           if ( blockDepth > 2 ) {
                              jsonLabel += ", \n\"LLD_SubBlock\" : [ { \".meta\" : { \"created\" : \"true\" } ";
                           } else {
                              jsonLabel += ", \n\"LLD_Block\" : [ { \".meta\" : { \"created\" : \"true\" } ";
                           }
                        } else {
                           jsonLabel += ", \n{ \".meta\" : { \"created\" : \"true\" } ";
                        }
                        // This is where we need to determine if there is a sibling block!
                        lastBlock = CheckIfLastSibling( parentArray, parentIdx, "block" );
                        jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock );
                     // entityIdx--;
                     // if ( json.indexOf( "Tag107" ) >= 0 ) {
                        // console.log( "json: " + json );
                        // console.log( obj["content"] );
                        // lastBlock = CheckIfLastBlockSibling( parentArray, parentIdx );
                     // }
                     }
                  // console.log( obj["content"] );
                     firstBlockIn.isFirst = firstBlock.isFirst = lastBlock;
                     jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, obj["content"], 0, true, false, firstBlock );
                     if ( isBlock ) {
                        if ( lastBlock ) {
                           jsonLabel += " } ]";
                        } else {
                           jsonLabel += " }";
                        }
                     }
                     if ( isPage && lastPage ) {
                        jsonLabel += " } ]";
                     }
                     if ( isPanel && lastPanel ) {
                        jsonLabel += " } ]";
                     }
                     if ( isLabel ) {  // there is only one label
                        jsonLabel += " } ]";
                     }
                  }
               } else if ( type === false ) {
                  // we're looking at attributes
               // console.log( "Looking for attributes in: " + obj['id'] );
                  for ( var prop in obj ) {
                  // console.log( obj[prop] );
                     if ( prop === "id" ) {
                        // 'id' and 'name' should be the same!
                     // if ( obj['id'] !== obj['name']) {  ... we no longer name the divs
                     //    alert( "Houston ... we have a problem with id != name" );
                     // }

                        // Guarantee the Tag is set properly in the element data.
                     // jsonLabel += ", \"Tag\" : \"" + trimLeadingAndTrailingWhiteSpace( obj[prop] ) + "\"";
                        $("#" + obj['id']).data( "z_^tag", obj['id'] );

                        // So let's get the all of the custom properties for this element
                     // displayElementData( "TranslateWysiwygDesignToJsonLabel", $("#" + obj['id']) );
                        jsonLabel += elementDataToJSON( obj['id'] );
                     } /* else if ( prop === "style" ) {   these are done using the "data" versions
                        // do position and size
                        var stylelist = obj[prop];
                        jsonLabel += formatStyle( stylelist, "top" );
                        jsonLabel += formatStyle( stylelist, "left" );
                        jsonLabel += formatStyle( stylelist, "height" );
                        jsonLabel += formatStyle( stylelist, "width" );
                     } */
                  }
               }
            // json += "\n";
            }
         }
      } else if ( objType === 'string' ) {
         jsonLabel += quoteLiteral( obj.toString().split("\\").join("\\\\").split('"').join('\\"'), "\"" );
      } else if ( objType === 'number' || objType === 'boolean' ) {
        jsonLabel += quoteLiteral( obj, "", comma );
      } else {
         jsonLabel += "UNKNOWN object type: " + objType;
      }
   // console.log( jsonLabel );
      recurse--;

      return jsonLabel;
   }

   function formatStyle( stylelist, attr, comma ) {
      var idx = stylelist.indexOf( attr );
      var str = "";
      if ( idx >= 0 ) {
         var idxColon = stylelist.indexOf( ":", idx );
         if ( idxColon >= 0 ) {
            idxColon++;
            while ( isWhiteSpace( stylelist.charAt( idxColon ) ) ) {
               idxColon++;
            }
            str = ", \"" + capitalize( attr ) + "\"" + " : \"";
            var idxSemicolon = stylelist.indexOf( ";", idxColon );
            if ( idxSemicolon >= 0 ) {
               str += stylelist.substring( idxColon, idxSemicolon );
            } else {
               str += stylelist.substring( idxColon );
            }
            str += "\"";
         }
      }

      return str;
   }

   function MakeContentVisible( element, visible ) {
      var img = element.previousSibling.firstChild;
      if ( !!img.tagName && img.tagName.toLowerCase() === "img") {
         element.style.display = visible ? 'inline' : 'none';
         element.previousSibling.firstChild.src = visible ? window.ImgExpanded : window.ImgCollapsed;
      }
   }

   function ExpImgClicked( img ) {
      var container = img.parentNode.nextSibling;
      if ( !container ) {
         return;
      }
      var disp = "none";
      var src = window.ImgCollapsed;
      if ( container.style.display === "none" ) {
         disp = "inline";
         src = window.ImgExpanded;
      }

      container.style.display = disp;
      img.src = src;
   }

   $("#SnapType").selectmenu({
      close: function( event, data ) {  // use close event instead of change event because we always want to apply the selection, even if no change
         if ( g_$current_block ) {
            var value = $(this).val();
         // console.log( "close: " + value );
            g_$current_block.draggable( "option", "snap", false );  // reset so changes are applied if necessary
            g_$current_block.draggable( "option", "grid", [1, 1] );
            if ( value === "default" || value === "none" ) {
               // nothing to do
            } else {
               g_$current_block.draggable( "option", "snap", true );
               if ( value === "grid" ) {
                  g_$current_block.draggable( "option", "grid", [g_currentSnapX, g_currentSnapY] );
               } else if ( value === "inner" ) {
                  g_$current_block.draggable( "option", "snapMode", "inner" );
               } else if ( value === "outer" ) {
                  g_$current_block.draggable( "option", "snapMode", "outer" );
               } else if ( value === "both" ) {
                  g_$current_block.draggable( "option", "snapMode", "both" );
               }
            }
         }
      }
   });

   function formatTitle( entity, obj ) {
      var name;
      var space;
      if ( obj["LLD_SectionType"] ) {
         name = obj["LLD_SectionType"];
         space = ": ";
      }
      else
      {
         name = "";
         space = "";
      }
      if ( obj["ContinuationBlockFlag"] ) {
         name += "[**continued**]";
         space = ": ";
      }
      if ( obj["Name"] ) {
         name += space + obj["Name"];
         space = " - ";
      }
      if ( obj["ImageName"] ) {
         name += space + obj["ImageName"];
      }
      if ( name === "" ) {
         if ( entity === "panel" ) {
            name = "Panel: ";
         }
         var id = obj["ID"];
         if ( id ) {
            name += id + " : ";
         }
         name += obj["Tag"];
      }
      return name;
   }

   function AddHtmlLabelElementAttributes( $root, $parentElement, parentId, obj, entity, depth ) {
   // console.log( "AddHtmlLabelElementAttributes processing entity: " + entity );
      var $element;
      var attr = "";
      var style = "style=\"position:absolute;";
      for ( var prop in obj ) {
         if ( typeof obj[prop] === "string" ) {
         // console.log ( "Property for entity: " + entity + " prop: " + prop + ": " + obj[prop] );
            if ( prop === "Tag" ) {
               continue;
            } else if ( prop === "Top" || prop === "Left" ) {
               style += prop.toLowerCase() + ":" + scaledInch2Pixel( obj[prop], 0 ) + ";";
            } else if ( prop === "Height" || prop === "Width" ) {
               style += prop.toLowerCase() + ":" + scaledInch2Pixel( obj[prop], 4 ) + ";"; // 2*g_pixelsBorder
            } else {
               if ( prop === "Depth" ) {
                  var objDepth = parseInt( obj[prop] );
                  if ( objDepth !== depth ) {
                     console.log( "AddHtmlLabelElementAttributes depth: " + depth + "  is not equal to object depth: " + objDepth +
                                  "  for Tag: " + obj["Tag"] + "  within parent: " + parentId );
                  }
               // depth = parseInt( obj[prop] );
               }
            }
         }
      }

      var id = obj["ID"];
      // $(tag).innerHTML = attr + style;
      if ( entity === "block" || entity === "panel" ) {
         var name = formatTitle( entity, obj );
         var tag = obj["Tag"];
         if ( !tag ) {
            if ( id === null || id === "" ) {
               id = getUniqueId();
               tag = id;
            } else {
               tag = "Tag" + id;
            }
         }
         var identity = "id=\"" + tag + "\" name=\"" + tag + "\" ";
         var classes = "class=\"" + entity;
         if ( entity === "panel" ) {
            classes += " block";  // hack to permit panels to resize properly
         }

         if ( tag.indexOf( "Tag" ) === 0 && $.isNumeric( tag.substring( 3 ) ) ) {
            var tagNbr = parseInt( tag.substring( 3 ) );
            if ( g_generateTag < tagNbr ) {
               g_generateTag = tagNbr;
            }
         }
         classes += " draggable canvas-element block-element";

         // var tab = buildTab( depth, false );
         classes += "\" ";
         style += "background-color: " + getBackgroundColorForDepth( depth ) + "; display: block; float: left; color: " + getColorForDepth( depth ) + "; border: 2px solid; background-position: initial initial; background-repeat: initial initial;\"";
         var div = "<div " + identity + classes + style + attr + "></div>";
      // console.log( "draggable containment: #" + $root.attr( "id" ) );
      // console.log( "resizeable containment: #" + $root.attr( "id" ) );
         $element = $(div).text( name )
              .draggable({
                 cancel: "a.ui-icon", // clicking a link with class .ui-icon won't initiate dragging
                 containment: "#" + $root.attr( "id" ),
                 appendTo: "body",  // this keeps the drag item visible across divs
                 cursor: "move" })
              .resizable({ containment: "#" + $root.attr( "id" ) })
              .prepend( "<div style=\"float:bottom\">\n" +
                        "</div>" )
            //.append( "<h5 class=\"ui-widget-header\"></h5>" );
              .append( "<h5></h5>" );
         $element.children( ".ui-resizable-handle" ).css( "z-index", "" );  // prevent these from "showing through"
         $parentElement.append( $element );
         for ( var prop in obj ) {
            if ( typeof obj[prop] === "string" ) {
            // if ( prop === "Tag" || prop === "Top" || prop === "Left" || prop === "Height" || prop === "Width" ) {
            //    continue;
            // } else {
                  addZeidonAttributeToElement( $element, prop, obj[prop] );
            // }
            }
         }
         addZeidonAttributeToElement( $element, "Tag", tag );
      // addZeidonAttributeToElement( $element, "DebugEntity", entity );  // add this for debugging purposes
/*
         <div class=\"block draggable ui-widget-content ui-draggable canvas-element block-element ui-resizable\" style=\"position: absolute; top: 51px; left: 212px; height: 100px; width: 100px; background-color: rgb(204, 255, 204); display: block; float: left; color: rgb(255, 0, 0); border: 2px solid; background-position: initial initial; background-repeat: initial initial;\" id=\"Tag110\" name=\"Tag110\" z_^depth=\"1\">

         <div class=\"block draggable ui-widget-content ui-draggable canvas-element block-element ui-resizable\" style=\"position: absolute; top: 52px; left: 219px; height: 100px; width: 100px; background-color: rgb(204, 255, 204); display: block; float: left; color: rgb(255, 0, 0); border: 2px solid; background-position: initial initial; background-repeat: initial initial;\" id=\"Tag110\" name=\"Tag110\" z_^depth=\"1\">
            <div style=\"float:bottom\">
            </div>Tag110
            <div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90; display: block;\"></div>
            <div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90; display: block;\"></div>
            <div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90; display: block;\"></div>
            <h5 class=\"ui-widget-header\"></h5>
         </div>
*/
      } else { // must be label or page
         if ( entity === "page" ) {
            $element = $root;
         } else if ( entity === "label" ) {
            $element = $parentElement;
         } else {
            throw new Error( "The JSON object contains an unexpected entity: " + entity );
         }
      // style += "\"";
      // $element.innerHTML = identity + style;
         for ( var prop in obj ) {
            if ( typeof obj[prop] === "string" ) {
            // if ( prop === "Tag" || prop === "Top" || prop === "Left" || prop === "Height" || prop === "Width" )  {
            //   continue;
            // } else {
                  addZeidonAttributeToElement( $element, prop, obj[prop] );
            // }
            }
         }
      }

      addZeidonAttributeToElement( $element, "wID", (id === null || id === "") ? tag : id );
      addZeidonAttributeToElement( $element, "Depth", depth );
      return $element;
   }

   function AddSpecialAttributes( $block, obj ) {
      var sectionType = obj["LLD_SectionType"]; // if there is no section type, we have nothing
      if ( ! sectionType || sectionType === "" ) {
      // console.log( "SpecialSection undefined" );
      } else {
         var objSpecial = obj["LLD_SpecialSectionAttribute"];
         if ( objSpecial ) {
            for ( var k = 0; k < objSpecial.length; k++ ) {
               var objSpecialAttr = objSpecial[k];
               if ( objSpecialAttr ) {
                  var specialSection = objSpecialAttr["Name"];
               // console.log( "SpecialSection: " + sectionType + "." + specialSection );
                  var objSpecialBlock = objSpecialAttr["LLD_SpecialSectionAttrBlock"];
                  if ( objSpecialBlock ) {
                     var objSpecialBlockProp = objSpecialBlock[0];
                     if ( objSpecialBlockProp ) {
                        var color = "";
                        for ( var prop in objSpecialBlockProp ) {
                           if ( prop !== ".meta" ) {
                              if ( prop === "SpecialAttributeTextColor" ) {
                                 var objColor = objSpecialBlockProp[prop][0];
                                 color = objColor.dColorName;
                                 if ( !color ) {
                                    color = objColor.Pantone;
                                    if ( !color ) {
                                       color = objColor.Name;
                                    }
                                 }
                              } else {
                              // console.log( "   SpecialBlock: " + prop + "." + objSpecialBlockProp[prop] );
                                 addZeidonAttributeToElement( $block, sectionType + "." + specialSection + "." + zeidonAttributeToKey( prop ), objSpecialBlockProp[prop] );
                              }
                           }
                        }
                        addZeidonAttributeToElement( $block, sectionType + "." + specialSection + "." + "z_^text^color", color );
                     }
                  }
               }
            }
         }
      }
   }

   // for ( var k = 0; k < objPage.length; k++ ) {
   //    AddHtmlWysiwygLabelElements( $("#page" + (k + 1)), $parentElement, parentId, objPage[k], "page", 0 );

   function AddHtmlWysiwygLabelElements( $root, $parentElement, parentId, obj, div, depth ) {
      if ( div === "block" || div === "panel" || div === "page" || div === "label" ) {
      // console.log( "Processing div: " + div );
         var $el = AddHtmlLabelElementAttributes( $root, $parentElement, parentId, obj, div, depth );
         addZeidonAttributeToElement( $el, "_EOI", "Y" );  // existed on OI
         addZeidonAttributeToElement( $el, "wE", div );
         addZeidonAttributeToElement( $el, "wPID", parentId );
         addZeidonAttributeToElement( $el, "wPE", $parentElement.data( "z_w^e" ) );
         if ( div === "block" ) {
            AddSpecialAttributes( $el, obj );
         }
      // console.log( "Setting4 wPID: " + parentId + "  wPE: " + $parentElement.data( "z_w^e" ) );
      // displayElementData( "AddHtmlWysiwygLabelElements Parent", $parentElement );
      // displayElementData( "AddHtmlWysiwygLabelElements Element", $el );
         $parentElement = $el;
         parentId = obj["ID"];
      /*
         if ( obj["Tag"] ) {
            $parentElement = $("#" + obj["Tag"]);
         } else {
            $parentElement = $("#" + obj["ID"]);
         }
      */
      } else {
         console.log( "Unknown div: " + div );
      }

      for ( var prop in obj ) {
         if ( prop === ".meta" ) {
            // do nothing
         }
         else
         if ( prop === "LLD_SubBlock" || prop === "LLD_Block" || prop === "LLD_Panel" ) {
            var objBlock = obj[prop];
            for ( var k = 0; k < objBlock.length; k++ ) {
               AddHtmlWysiwygLabelElements( $root, $parentElement, parentId, objBlock[k], prop === "LLD_Panel" ? "panel" : "block", depth + 1 );
            }
         }
      }
   }

   function RenderWysiwygLabelFromZeidonJson( jsonObj, isArray, isPropertyContent ) {
      if ( $.isArray( jsonObj ) ) {
         if ( jsonObj.length !== 1 ) {
            throw new Error( "The JSON object is not a valid Zeidon Label Definition" );
         } else {
            var obj = jsonObj[0];
            var objOimeta = obj[".oimeta"];
            if ( objOimeta["odName"] !== "mSPLDef" ) {
               throw new Error( "The JSON meta object type is invalid:" + objOimeta['odName'] );
            }

            if ( objOimeta["application"] !== null ) {
               g_application = objOimeta["application"];
            }

            var objSPLD = obj["SubregPhysicalLabelDef"][0];
            if ( objSPLD === null ) {
               throw new Error( "The JSON object does not contain an SubregPhysicalLabelDef property: " + obj );
            }

            var objLLD = objSPLD["SPLD_LLD"][0];
            if ( objLLD === null ) {
               throw new Error( "The JSON object does not contain an SPLD_LLD property: " + objSPLD );
            }

            for ( var prop in objLLD ) {
               if ( prop === ".meta" ) {
                  // do nothing
               }
               else
               if ( prop === "ID" ) {
                  var $label = $("#label");
                  AddHtmlLabelElementAttributes( null, $label, "", objLLD, "label", 0 );
                  addZeidonAttributeToElement( $label, "wE", "label" );
               }
               else
               if ( prop === "Name" ) {
                  $("#label").innerText = objLLD["Name"];
               }
               else
               if ( prop === "LLD_Page" ) {
                  var objPage = objLLD["LLD_Page"];
                  var $parentElement = $("#label");
                  var parentId = objLLD["ID"];
                  var $page;
                  for ( var k = 0; k < objPage.length; k++ ) {
                     $page = $("#page" + (k + 1));
                     addZeidonAttributeToElement( $page, "PageNbr", k + 1 );
                     AddHtmlWysiwygLabelElements( $page, $parentElement, parentId, objPage[k], "page", 0 );
                  }
               }
               else
               if ( prop === "ViewObjRef" ) {
                  var $selected = $('#selectedRegisteredViews').empty();
                  var objViewObjRef = objLLD["ViewObjRef"];
                  for ( var k = 0; k < objViewObjRef.length; k++ ) {
                     var el = $("<li uniqueidentity=\"" + objViewObjRef[k].ZKey + "\" class=\"ui-state-highlight\">" + objViewObjRef[k].Name + "</li>");
                     $selected.append( el );
                  // el.draggable({ helper: 'clone' });
                  }
               }
            }
         }
      } else {
         throw new Error( "The JSON does not contain a valid Zeidon Label Definition: " + jsonObj );
      }
   }

   // Additional parameters:
   //   data - contains the resulting data from the request
   //   status - contains the status of the request ("success", "notmodified", "error", "timeout", or "parsererror")
   //   xhr - contains the XMLHttpRequest object
   function LoadZeidonJsonFromLLD_Callback( jsonZeidon, status, xhr ) {
      if ( xhr.readyState === 4 ) {
         if ( xhr.status === 200 ) {
         // parseMessages( req.responseXML );
         // console.log( "JSON Zeidon returned from call to servlet: " + jsonZeidon );
            try {
               g_generateTag = 100;
               $("#page").attr( "id", "page" + g_currentPage )
                         .attr( "name", "page" + g_currentPage )
                         .removeClass( "page_active" )
                         .addClass( "page_hidden" )
                         .hide();

            // $(".page").empty(); does too much
            // $('#zmasterdiv').empty();  clears the master div.
            // $('#zmasterdiv div').empty(); clears all the child divs, but leaves the master intact.
            /*
               $(".page").each( function() {
                  while ( $(this).firstChild ) {
                     $(this).removeChild( $(this).firstChild );
                  }
               });
            */
               $("#label div").empty();
               $("#label").removeData();
               $(".page").each( function( idx ) {
                  $(this).hide()
                         .removeData()
                         .css( "background-color", "#f5f5fa" )
                         .addClass( "ui-droppable page_hidden" )
                         .text( idx + 1 );
               });

               // clear all zeidon mapping
               $("input.zeidon, select.zeidon").each( function() {
               // console.log( "Clearing element: " + $(this).attr( "id" ) );
               // if ( $(this).attr( "id" ) === "CSS_File" ) {
               //    console.log( "Clearing CSS_File element: " + $(this).attr( "id" ) );
               // }
               /* not using colorwell at present
                  if ( $(this).hasClass( "colorwell" ) ) {
                     var colorPicker = $.farbtastic( "#" + $(this).attr( "id" ) );
                     colorPicker.setColor( "#ffffff" );
                     $(this).val( "#ffffff" );
                  } else {
               */
                     $(this).val( "" );
               // }
               });

            // var jsonObj = eval( "[" + data + "]" );
               var jsonObj = jsonStringToJsonObject( jsonZeidon );
               g_ViewNameMap.setNameForView( jsonObj, "LLD_View" );
               jsonObj = jsonObj[0];
               var jsonMeta = jsonObj[".meta"];
               g_metaVersion = jsonMeta["version"];
               g_metaDate = jsonMeta["date"];
               var jsonColors = jsonObj["Colors"];
               var jsonReuse = jsonObj["ReusableBlocks"];
               var jsonMarketing = jsonObj["Marketing"];
               var jsonBlockTags = jsonObj["BlockTags"]
               jsonObj = jsonObj["OIs"];

               // Display the JSON coming back (to the client) from Zeidon (server).
            // var formattedHtml = renderJsonObjectAsFormattedHtml( jsonObj, 0, false, false, false );
            // $id("zFormattedJsonLabel").innerHTML = "<PRE class='CodeContainer'>" + formattedHtml + "</PRE>";

               // Now actually display the LLD in the designer.
               RenderWysiwygLabelFromZeidonJson( jsonObj, false, false );
            // if ( g_scale && g_scale !== 1 ) {
                  resizeImg();
            // }
               setColors( jsonColors );
               setReusableBlocks( jsonReuse );
               setMarketing( jsonMarketing );
               setBlockTags( jsonBlockTags );
            } catch(e) {
               $id("zFormattedJsonLabel").innerHTML = jsonZeidon;
               alert( "JSON is not well formatted:\n" + e.message );
            } finally {
               g_updatedLLD = false;
               g_selected_first = null;
               g_selected_list = [];
               g_undo_list = [];
               g_$current_block = null;
               g_currentPage = 1;
               $("#page" + g_currentPage).attr( "id", "page" )
                                         .attr( "name", "page" )
                                         .removeClass( "page_hidden" )
                                         .addClass( "page_active" )
                                         .show();
               mapElementDataToUiData( null );
               mapElementDataToUiData( $("#label") );
               mapElementDataToUiData( $("#page") );
               $PageSpinner.spinner( "value", 1 );

               $(".block").each( function() {
                  setBlockDraggableResizable( $(this).parent(), $(this), $(this) );
               });
               setPageBackgroundSize();

/* debug code
   $("#page").attr( "id", "page" + g_currentPage ).attr( "name", "page" + g_currentPage );
   var $initElement = $("#label");
   var jsonDOM = mapDOM( $initElement[0], true );
   console.log( "JSON DOM Debug3: " + jsonDOM );
   var jsonLabel = CaptureZeidonLabelJsonFromDomJson( jsonDOM );

   // Display the resultant JSON that will be passed to Zeidon to be saved as an LLD.
   console.log( "\nJsonLabel Debug3: " + jsonLabel );
   $("#page" + g_currentPage).attr( "id", "page" );
 end debug code */

            }
         }
      }
   }

/*
   function LoadZeidonJsonFromLLD( name ) {
      try {
         var url = "labeldesigner?action=loadLabel&fileName=" + escape( name );
         req = initRequest();
         req.open( "POST", url, true );
         req.onreadystatechange = LoadZeidonJsonFromLLD_Callback;
         req.send( null );
      } catch(e) {
         alert( "Could not load file: " + name + "\n" + e.message );
      } finally {
         $("#page" + currentPage).attr( "id", "page" );
      }
   }
*/
   function LoadZeidonJsonFromLLD( name ) {
      try {
         // Assign handlers immediately after making the request and remember the jqxhr object for this request
         // Retrieve the JSON version of the label from Zeidon (on the server) in a saved LLD.
         var url = "labeldesigner?action=loadLabel&viewName=" + escape( name );
         var jqxhr = $.post( url, LoadZeidonJsonFromLLD_Callback ) // url + the function to run if the request succeeds
            .done( function() {
            // console.log( "Load Zeidon From LLD: second success" );
            })
            .fail( function() {
               alert( "error " + jqxhr.responseText );
            })
            .always( function() {
            // console.log( "Load Zeidon From LLD: always finished" );
         });

         // Perform other work here ...

         // Set another completion function for the request above
         jqxhr.always( function() {
         // console.log( "Load Zeidon From LLD: second always finished" );
         });

      } catch(e) {
         alert( "Could not load OI: " + name + "\n" + e.message );
      } finally {
         $("#page" + g_currentPage).attr( "id", "page" );
         g_$current_block = null;

         // TODO: display the label/page/block properties
      }
   }

   $("ul.droptrue").sortable({
      connectWith: "ul"
   });

   $("ul.dropfalse").sortable({
      connectWith: "ul",
      dropOnEmpty: false
   });

 /*  
   $("#zLLD_LoadRegisteredViews").click( function() {
      var name = $("#zLLD_Name").val();
      if ( name === "" ) {
      // alert( "LLD Name is required for Registered Views! ... assuming xx for now!" );
      // name = "xx";
         alert( "LLD Name is required for Registered Views!" );
         return false;  // prevent default propagation
      }

      var url = "labeldesigner?action=loadRegisteredViews&fileName=" + escape( name );

      $.ajax({
         url : url,
         type : 'POST',
         data : { registeredViews : "rv" },
         dataType : 'json',
         success : function( data ) {
         // console.log( "Return from loadRegisteredViews: " + data );
            var jsonObj = jsonStringToJsonObject( data );
            simpleTraverseJsonObject( jsonObj, false );
            var $select = $('#selectRegisteredViews').empty();
         // $select.append( "<li class=\"ui-state-default\">Drag registered views...</li>" );
            $.each(jsonObj.registeredViews, function( k, item ) {
               var el = $("<li uniqueidentity=\"" + item.ZKey + "\" class=\"ui-state-default\">" + item.Name + "</li>");
               $select.append( el );
               el.draggable({ helper: 'clone' });
            });
         }
      });

      return false;  // prevent default propagation
   });
*/
// $("#sortable1, #sortable2, #sortable3").disableSelection();

   $(".equalheight").equalHeights( 400 );

   function supportsLocalStorage() {
      try {
         return 'localStorage' in window && window['localStorage'] !== null;
      } catch (e) {
         return false;
      }
   }

   function updateRegisteredViewsSession() {
      g_updatedLLD = true;
      if ( supportsLocalStorage() ) {
         // { "employees": [ { "firstName":"John" , "lastName":"Doe" }, { "firstName":"Anna" , "lastName":"Smith" } ] }
         var jsonRegisteredViews;
         var arrayRegisteredViews = "{ \"registeredViews\" :";
         var first = true;

         $("#selectedRegisteredViews li").each( function() {
            var metaZKey = $(this).data( "uniqueidentity" );
            var metaViewName = $(this)[0].innerText;
         // alert( "ZKey: " + metaZKey + "   Name: " + metaViewName );
            if ( first ) {
               arrayRegisteredViews += " [ ";
               first = false;
            }

            arrayRegisteredViews += "{ \"ZKey\" : \"" + metaZKey + "\", \"Name\" : \"" + metaViewName + "\" }, ";
         });

         if ( first === false ) {
            var k = arrayRegisteredViews.lastIndexOf( "," );
            jsonRegisteredViews = arrayRegisteredViews.substring( 0, k ) + " ] }";
         } else {
            jsonRegisteredViews = arrayRegisteredViews + " [] }";
         }

         var storageS = window.sessionStorage; // use when you need to store something that changes or something temporary
      // var storageL = window.localStorage; // use for long term use
         storageS.registeredViews = JSON.stringify( jsonRegisteredViews );
      // storageL.registeredViews = JSON.stringify( g_jsonLabel );
         return jsonRegisteredViews;
      }

      return "";
   }

/*
   $("#zLLD_SaveRegisteredViews").click( function() {
      var name = $("#zLLD_Name").val();
      if ( name === "" ) {
         alert( "LLD Name is required for Save Registered Views! ... assuming xx for now!" );
         name = "xx"; // return false;
      }

      var jsonRegisteredViews = updateRegisteredViewsSession();
      var url = "labeldesigner?action=saveRegisteredViews&fileName=" + escape( name );

      // Display the resultant JSON that will be passed to Zeidon to be saved as an LLD.
   // console.log( "\nJson Registered Views: " + jsonRegisteredViews );

      $.ajax({
         url : url,
         type : 'POST',
         data : { "fileName" : "mSPLDef", "registeredViews" : jsonRegisteredViews },
         dataType : 'json',
         success : function( data ) {
         // console.log( "Return from saveRegisteredViews: " + data );
            var jsonObj = jsonStringToJsonObject( data );
            simpleTraverseJsonObject( jsonObj, false );
         }
      });

      return false;  // prevent default propagation
   });
*/
   var fnEnsureInDropTargetOnce = function( event, ui ) {
      var toDrop = $(ui.draggable).clone();
      if ( $("#selectedRegisteredViews").find( "li[uniqueIdentity=" + toDrop.data( "uniqueIdentity" ) + "]" ).length <= 0 ) {
         toDrop.removeClass("ui-state-default").addClass( "ui-state-highlight" );
         $("#selectedRegisteredViews").append( toDrop );
         updateRegisteredViewsSession();
      }
      else {
         return false;
      }
   };

   $("#selectRegisteredViews li").draggable({ helper: 'clone' });

   $("#selectRegisteredViews").droppable({ drop: function( event, ui ) {
                                                   $(ui.draggable).remove();
                                                   updateRegisteredViewsSession();
                                                 }
   });

   $("#selectedRegisteredViews")
      .droppable({ drop: fnEnsureInDropTargetOnce })
      .sortable({ connectWith: ".connectedSortable" }).disableSelection();

   function recurseUndo( $item ) {
      var children = $item.children( ".block" );
      while ( children.length > 0 ) {
         var child = children[0];
         children.splice( 0, 1 );
         recurseUndo( $(child) );
      }
   // console.log( "Undoing Delete: " + $item[0].id );
      $item.data( "z__^delete", "" ).addClass( "canvas-element" ).show();
   }

   function recurseDelete( $item ) {
      var children = $item.children( ".block" );
      while ( children.length > 0 ) {
         var child = children[0];
         children.splice( 0, 1 );
         recurseDelete( $(child) );
      }
   // console.log( "Deleting: " + $item[0].id );
      $item.css( "border", "2px solid #000" ).data( "z__^delete", "Y" ).removeClass( "canvas-element" ).hide();
   }

   $(document).keydown( function( e ) {
   // alert( event.keyCode );
      if ( e.ctrlKey ) {
         if ( e.keyCode === 90 ) { // Ctrl+Z keydown combo - Undo (only implemented for delete)
            if ( g_undo_list.length > 0 ) {
               var undo = g_undo_list.pop();  // The shift() method removes the first item of an array, and returns that item.
                                              // To remove the last item of an array, use the pop() method.
               while ( undo.length > 0 ) {
                  var item = undo[0];
               // console.log( item.id );
                  undo.splice( 0, 1 );
                  recurseUndo($(item) );
                  g_updatedLLD = true;
               }
            }
         } else if ( e.keyCode === 123 ) { // Ctrl + F12 keydown combo
            var jsonObj = g_ViewNameMap.getViewByName( "LLD_CurrentView" );
            if ( jsonObj != null ) {
               g_ViewNameMap.dropNameForView( jsonObj, "LLD_CurrentView" );
            }
            var jsonLabel = GetCurrentLabel();
            jsonObj = jsonStringToJsonObject( jsonLabel );
            g_ViewNameMap.setNameForView( jsonObj, "LLD_CurrentView" );
         // console.log( "Ctrl+F12 has been pressed!" );
         // g_jsonLabel1 = jsonStringToJsonObject( g_JsonNewLabel );
         // g_jsonLabel2 = jsonStringToJsonObject( g_JsonNewLabelA );
         // g_ViewNameMap.setNameForView( g_jsonLabel1, "dks1_viewname" );
         //g_ViewNameMap.setNameForView( g_jsonLabel2, "dks2_viewname" );
         // var cursorsLabel = g_ViewNameMap.getViewByName( "dks1_viewname" );
         // console.log( "getViewByName found: " + cursorsLabel );
            var myWindow = openDebugWin();
         // var arrHeader = [ "NickName, ProperName, Description" ];
         // var myWindow = openSortWin( "Nick Names", "viewName", "entityName", arrHeader, null );
         } else if ( g_selected_list.length > 0 ) {
            var scale = g_pixelsPerInch * g_scale;
            var k = 0;
            var change = false;
            while ( k < g_selected_list.length ) {
               var $el = $(g_selected_list[k]);
               var height = 0;
               var width =  0;
               if ( e.keyCode === 38 ) { // up arrow
                  height -= 8;
               } else if ( e.keyCode === 40 ) { // down arrow
                  height += 4;
               } else if ( e.keyCode === 37 ) { // left arrow
                  width -= 8;
               } else if ( e.keyCode === 39 ) { // right arrow
                  width += 4;
               }
               if ( height !== 0 ) {
                  change = true;
                  height += $el.cssInt( 'height' );
                  $el.css({ height: height });
                  $el.data( "z_^height", (height / scale).toFixed( 3 ) );
                  if ( $el[0] === g_$current_block[0] ) {
                     mapElementDataToUiData( g_$current_block );
                  }
               }
               if ( width !== 0 ) {
                  change = true;
                  width += $el.cssInt( 'width' );
                  $el.css({ width: width });
                  $el.data( "z_^width", (width / scale).toFixed( 3 ) );
                  if ( $el[0] === g_$current_block[0] ) {
                     mapElementDataToUiData( g_$current_block );
                  }
               }
               k++;
            }
            if ( change ) {
               g_updatedLLD = true;
               return false;
            }
         }
      } else if ( e.keyCode === 46 ) { // Delete keydown
      // alert( "Document Delete Key Pressed" );
         var new_array = g_selected_list.slice();  // shallow copy of array to be used in undo
         if ( new_array.length > 0 ) {
            g_undo_list.push( new_array ); // The push() method adds new items to the end of an array, and returns the new length.
                                           // To add items at the beginning of an array, use the unshift() method.
         }
         while ( g_selected_list.length > 0 ) {
            var item = g_selected_list[0];
            g_selected_list.splice( 0, 1 );
            recurseDelete($(item) );
            g_updatedLLD = true;
         }
         g_selected_first = null;
      } else if ( e.shiftKey ) {
         if ( g_selected_list.length > 0 ) {
            var scale = g_pixelsPerInch * g_scale;
            var k = 0;
            var change = false;
            g_updatedLLD = true;
            while ( k < g_selected_list.length ) {
               var $el = $(g_selected_list[k]);
               var top = 0;
               var left =  0;
               if ( e.keyCode === 38 ) { // up arrow
                  top -= 8;
               } else if ( e.keyCode === 40 ) { // down arrow
                  top += 4;
               } else if ( e.keyCode === 37 ) { // left arrow
                  left -= 8;
               } else if ( e.keyCode === 39 ) { // right arrow
                  left += 4;
               }
               if ( top !== 0 ) {
                  change = true;
                  top += $el.cssInt( 'top' );
                  $el.css({ top: top });
                  $el.data( "z_^top", (top / scale).toFixed( 3 ) );
                  if ( $el[0] === g_$current_block[0] ) {
                     mapElementDataToUiData( g_$current_block );
                  }
               }
               if ( left !== 0 ) {
                  change = true;
                  left += $el.cssInt( 'left' );
                  $el.css({ left: left });
                  $el.data( "z_^left", (left / scale).toFixed( 3 ) );
                  if ( $el[0] === g_$current_block[0] ) {
                     mapElementDataToUiData( g_$current_block );
                  }
               }
               k++;
            }
            if ( change ) {
               g_updatedLLD = true;
               return false;
            }
         }
      }
   });

   function scrollbarHeightWidth() {
      if ( g_scrollbar === null ) {
         var div = document.createElement("div");
         div.style.overflow = "scroll";
         div.style.visibility = "hidden";
         div.style.position = 'absolute';
         div.style.height = '100px';
         div.style.width = '100px';
         document.body.appendChild(div);
         var scrollHeight = div.offsetHeight - div.clientHeight;
         var scrollWidth = div.offsetWidth - div.clientWidth;
         document.body.removeChild(div);
         g_scrollbar = { height: scrollHeight, width: scrollWidth };
      }

   // console.log( "ScrollBar height: " + g_scrollbar.height + "  ScrollBar width: " + g_scrollbar.width );
   // return g_scrollbar;
   };

   function setLLD_sizes() {
      if ( g_windowHeight !== $(window).height() || g_windowWidth !== $(window).width() ) {
         g_windowHeight = $(window).height();
         g_windowWidth = $(window).width();
      // console.log( "window height: " + g_windowHeight );   // returns height of browser viewport
      // console.log( "document height: " + $(document).height() ); // returns height of HTML document
      // console.log( "window width: " + g_windowWidth );   // returns width of browser viewport
      // console.log( "document width: " + $(document).width() ); // returns width of HTML document
         // For screen size you can use the screen object in the following way:
         // 1920 x 1200
      // console.log( "screen height: " + screen.height );
      // console.log( "screen width: " + screen.width );
      // console.log( "devicePixelRatio: " + window.devicePixelRatio );

      // var w=window,d=document,e=d.documentElement,g=d.getElementsByTagName('body')[0],x=w.innerWidth||e.clientWidth||g.clientWidth,y=w.innerHeight||e.clientHeight||g.clientHeight;
      //console.log( "x:" + x + "  y:" + y );

      // console.log( "Window resize ======================================= " );
      // console.log( "window height: " + g_windowHeight );   // returns height of browser viewport
      // console.log( "document height: " + $(document).height() ); // returns height of HTML document
      // console.log( "window width: " + g_windowWidth );   // returns width of browser viewport
      // console.log( "document width: " + $(document).width() ); // returns width of HTML document

         var realWindowHeight = g_windowHeight - g_scrollbar.height;
         var realWindowWidth = g_windowWidth - 2*g_scrollbar.width;
         $("#zcontainer").css({ height: realWindowHeight, width: realWindowWidth });
         $("#zviewport").css({ height: realWindowHeight - 3*g_scrollbar.height, width: realWindowWidth - g_scrollbar.width });
         $("#zclient").css({ height: g_windowHeight - $("#zheader").height() - $("#zfooter").height(), width: realWindowWidth });

         $("#label").css({ height: realWindowHeight - $("#zheader").height() - $("#zfooter").height() - g_scrollbar.height, width: realWindowWidth - g_scrollbar.width });
         $("#zfooter").css({ top: realWindowHeight - $("#zfooter").height(), width: realWindowWidth - g_scrollbar.width });

      // var left = $(window).width() - $("#zmenu").width() - (4 * g_scrollbar.width) - 2;
         var left = realWindowWidth - $("#zmenu").width() - 3*g_scrollbar.width - 2;
         $("#zmenu").css({ left: left, height: $("#label").height() - g_scrollbar.height });
         $("#zaccordion").css({ left: left, height: $("#zmenu").height() });
         $("#zaccordion").accordion( "refresh" );
      // console.log( "zmenu calculated left: " + left );
         return true;
      } else {
      // console.log( "returning false" );
         return false;  // prevent default propagation
      }
   }
/*
<div id="zcontainer" name="zcontainer" style="height:9in; width:12in;">
   <div id="zviewport" name="zviewport" style="background-color:#00A5FF; height:0.4in;">
      <span>
         <div id="zheader" style="display: block; font-size: 1em; font-weight: bold;">
            Label Designer&nbsp;&nbsp;&nbsp;&nbsp;
            <div id="ztoolbar" class="ui-widget-header ui-corner-all">
               ...  
            </div> // ztoolbar
            <img src="./images/epamms.jpg" height="25" width="64" alt="ePamms" style="margin:5px; float:right; border-style:double;">
         </div> // zheader
      </span>
      <div id="zclient" name="zclient" style="margin:0"> <!-- client area -->
         <div id="pagemenu" name="pagemenu" class="ui-widget-content" style="position:relative;margin:0">
            <div id="label" name="label" class="label" style="top:0px;left:0px;float:left;position:absolute;">Drop area ...    // without position:relative, target position is off
               <div id="page"   name="page" class="page" style="display:block;">1</div> // page
            </div> // label
            <div id="zmenu" name="zmenu" class="toggler" style="background-color:#00D7FF;top:0px;height:9in;width:3.5in;float:right;position:absolute;">   // without position:relative, clone position is off
               <div id="zaccordion" name="zaccordion" style="margin-left:0;padding-left:0">
                  ...            
               </div> // zaccordion
            </div> // zmenu
         </div> // pagemenu
      </div> // zclient
   </div> // zviewport
   <div id="zfooter" name="zfooter" style="position:absolute;height:0.25in;background-color:#00A5FF;clear:both;text-align:left;">Copyright &copy; Arksoft, Inc.
      <span id="zdisplay_size" name="zdisplay_size" style="float:right;padding-right:10px;"></span>
      <span id="zdisplay_position" name="zdisplay_position" style="float:right;padding-right:10px;"></span>
   </div> // zfooter
</div> // zcontainer
*/

   $(window).resize( function() {
      return setLLD_sizes();
   });

   function equalSpaceOrAbut( id, el_array, scale ) {
      var pos = -1;
      var $item;
      if ( id === "ah" || id === "av" ) { // Abut Horizontal or Vertical
         // Abut each ctrl except for the top-most (or left-most) ctrl to the prior ctrl.
         el_array.forEach( function( item ) {
            $item = $(item);
            if ( pos >= 0 ) {
               if ( id === "ah" ) {
                  $item.css({ left: pos });
               } else {
                  $item.css({ top: pos });
               }
            }
            if ( id === "ah" ) {
               pos = $item.cssInt( 'left' ) + $item.cssInt( 'width' ) + 4; // 2*g_pixelsBorder;
            } else {
               pos = $item.cssInt( 'top' ) + $item.cssInt( 'height' ) + 4; // 2*g_pixelsBorder;
            }
         });
      } else {  // if ( id === "esh" || id === "esv" ) // Equal Space Horizontal or Vertical
         var used = 0;
         var extent = -1;
         var space;
         el_array.forEach( function( item ) {
            $item = $(item);
            if ( pos < 0 ) {
               if ( id === "esh" ) {
                  pos = $item.cssInt( 'left' );
               } else {
                  pos = $item.cssInt( 'top' );
               }
            }
            if ( id === "esh" ) {
               used += $item.cssInt( 'width' );
               space = $item.cssInt( 'left' ) + $item.cssInt( 'width' );
            } else {
               used += $item.cssInt( 'height' );
               space = $item.cssInt( 'top' ) + $item.cssInt( 'height' );
            }
            if ( space > extent ) {
               extent = space;
            }
         });
         
         // we've gotten dimensions ... now determine amount of space between each element
         space = (extent - used) / el_array.length - 1;
         el_array.forEach( function( item ) {
            $item = $(item);
            if ( id === "esh" ) {
               $item.css({ left: pos });
               $item.data( "z_^left", (pos / scale).toFixed( 3 ) );
               pos += $item.cssInt( 'width' ) + space;
            } else {
               $item.css({ top: pos });
               $item.data( "z_^top", (pos / scale).toFixed( 3 ) );
               pos += $item.cssInt( 'height' ) + space;
            }
         });
      }
   }

   function runAlign( button ) {
   // console.log( "zalign id: " + button.id );
      if ( g_selected_list.length > 1 && g_selected_first !== null ) {
         var scale = g_pixelsPerInch * g_scale;
         switch ( button.id ) {
            case "esh": // Equal Space Horizontal
            case "esv": // Equal Space Vertical
            case "ah": // Abut Horizontal
            case "av": // Abut Vertical
               var new_array = g_selected_list.slice();  // shallow copy of array to be used in sort (which modifies the array)
               new_array.sort( function( a, b ) {
                  var $a = $(a);
                  var $b = $(b);
                  var diff;
                  if ( button.id === "av" || button.id === "esv" ) {
                     diff = $a.cssInt( 'top' ) - $b.cssInt( 'top' );
                     if ( diff ) {
                        return diff;
                     } else {
                        return $a.cssInt( 'height' ) - $b.cssInt( 'height' );
                     }
                  } else {  // button.id === "ah" || button.id === "esh"
                     diff = $a.cssInt( 'left' ) - $b.cssInt( 'left' );
                     if ( diff ) {
                        return diff;
                     } else {
                        diff = $a.cssInt( 'width' ) - $b.cssInt( 'width' );
                        return diff;
                     }
                  }
               });
               equalSpaceOrAbut( button.id, new_array, scale );
               break;

            default:
               var $el = $(g_selected_first);
               var coord;
               var $item;
               g_selected_list.forEach( function( item ) {
               // console.log( item.id );
                  if ( g_selected_first.id !== item.id ) {
                     $item = $(item);
                  // console.log( "zalign item id: " + item.id );
                  // displayElementData( "runAlign Before: ", $item );
                     switch ( button.id ) {
                        case "at": // Align Top
                           coord = $el.cssInt( 'top' );
                           $item.css({ top: coord });
                           $item.data( "z_^top", (coord / scale).toFixed( 3 ) );
                           break;

                        case "al": // Align Left
                           coord = $el.cssInt( 'left' );
                           $item.css({ left: coord });
                           $item.data( "z_^left", (coord / scale).toFixed( 3 ) );
                           break;

                        case "ab": // Align Bottom
                           coord = $el.cssInt( 'top' ) + $el.cssInt( 'height' ) - $item.cssInt( 'height' );
                           if ( coord < 0 ) {
                              coord = 0;
                           }
                           $item.css({ top: coord });
                           $item.data( "z_^top", (coord / scale).toFixed( 3 ) );
                           break;

                        case "ar": // Align Right
                           coord = $el.cssInt( 'left' ) + $el.cssInt( 'width' ) - $item.cssInt( 'width' );
                           if ( coord < 0 ) {
                              coord = 0;
                           }
                           $item.css({ left: coord });
                           $item.data( "z_^left", (coord / scale).toFixed( 3 ) );
                           break;

                        case "ew": // Equal Width
                           coord = $el.cssInt( 'width' );
                           $item.css({ width: coord });
                           $item.data( "z_^width", (coord / scale).toFixed( 3 ) );
                           break;

                        case "eh": // Equal Height
                           coord = $el.cssInt( 'height' );
                           $item.css({ height: coord });
                           $item.data( "z_^height", (coord / scale).toFixed( 3 ) );
                           break;

                        case "ewh": // Equal Width & Height
                           coord = $el.cssInt( 'width' );
                           $item.css({ width: coord });
                           $item.data( "z_^width", (coord / scale).toFixed( 3 ) );
                           coord = $el.cssInt( 'height' );
                           $item.css({ height: coord });
                           $item.data( "z_^height", (coord / scale).toFixed( 3 ) );
                           break;

                  } // end of: inner switch
               // displayElementData( "runAlign After: ", $item );
               }
            });
            g_updatedLLD = true;
         }
         mapElementDataToUiData( g_$current_block );
      }
   }

   function getColorPickerByRGB( hexColor ) {
      var lth = g_jsonColors.length;
      if ( lth > 0 ) {
         var idx = lth - 1;
         if ( hexColor.indexOf( "#" ) === 0 ) {
            hexColor = hexColor.substring( 1 );
         }
         for ( var k = 0; k < lth; k++ ) {
            if ( hexColor === g_jsonColors[k].RGB ) {
               idx = k;
               break;
            }
         }
         var name = g_jsonColors[idx].Pantone;
         if ( name === "" ) {
            name = g_jsonColors[idx].Name;
         }
         return name;
      } else {
         return "";
      }
   }

   function setColorPickerByName( $elColor, name ) {
      var lth = g_jsonColors.length;
      if ( lth > 0 ) {
         var idx = lth - 1;
         if ( name !== "" ) {
            for ( var k = 0; k < lth; k++ ) {
               if ( name === g_jsonColors[k].Pantone || name === g_jsonColors[k].Name ) {
                  idx = k;
                  break;
               }
            }
         }

         name = g_jsonColors[idx].Pantone;
         if ( name === "" ) {
            name = g_jsonColors[idx].Name;
         }
         var sib = $elColor.siblings('.colorPicker-picker')[0];
         $(sib).css( "background-color", "#" + g_jsonColors[idx].RGB ).css( "color", "#" + invertHexColor( g_jsonColors[idx].RGB ) ).text( name );
         $elColor.val( "#" + g_jsonColors[idx].RGB );
      } else {
         $elColor.val( "" );
      }
   }

   function initColorPicker( id, colors, names, idx ) {
      var $elColor = $(id);
      if ( ! $elColor.data( '_init' ) )
      {
         $elColor.data( '_init', "Y" );
      // $('#colorText').colorPicker( { colors: ["1111ff", "333333", "ff1111", "eeeeee", "feeeee"], names: ["Blue", "Black", "Red", "Gray", "Pink"], showHexField: false,
      //                               onColorChange : function(id, newValue) { console.log("ID: '" + id + "' has been changed to " + newValue); } } );
         $elColor.colorPicker( { colors: colors, names: names, showHexField: false,
                          onColorChange : function(id, newValue) {
                                             var lth = g_jsonColors.length;
                                             var idx = lth - 1;
                                             for ( var k = 0; k < lth; k++ ) {
                                                if ( newValue === "#" + g_jsonColors[k].RGB ) {
                                                   idx = k;
                                                   break;
                                                }
                                             }
                                             var name = g_jsonColors[idx].Pantone;
                                             if ( name === "" ) {
                                                name = g_jsonColors[idx].Name;
                                             }
                                          // console.log( "ID: '" + id + "' has been changed to: " + newValue + "  color: " + name );
                                             blurZeidon( $id(id), name );
                                          }
                          } );
      }
      if ( idx >= g_jsonColors.length ) {
         idx = g_jsonColors.length - 1;
      }

      // Plain English of "#header .callout":
      //  - Select all elements with the class name 'callout' that are decendents of the element with an ID of 'header'.
      var sib = $elColor.siblings('.colorPicker-picker')[0];
      if ( idx >= 0 ) {
         $(sib).css( "background-color", "#" + g_jsonColors[idx].RGB ).css( "color", "#" + invertHexColor( g_jsonColors[idx].RGB ) ).text( names[idx] );
         $elColor.val( "#" + g_jsonColors[idx].RGB );
      } else {
         $elColor.val( "" );
      }

      return $elColor;
   }

   function setColors( jsonColors )
   {
      var lth = jsonColors.length;
      var colors = [];
      var names = [];
      if ( $.isArray( jsonColors ) ) {
         var name;
         for ( var k = 0; k < lth; k++ ) {
            name = jsonColors[k].Pantone;
            if ( name === "" ) {
               name = jsonColors[k].Name;
            }
            colors.push( jsonColors[k].RGB );
            names.push( name );
            g_jsonColors.push( jsonColors[k] );
         }
      }
      colors.push( "EFEFEF" );
      names.push( "n/a" );
      g_jsonColors.push( { "Name" : "n/a", "RGB" : "EFEFEF", "Pantone" : "" } );
      // since lth is 1 less than the true length, we are initializing to n/a
      initColorPicker( '#zTextColor', colors, names, lth );
      initColorPicker( '#zBackgroundColor', colors, names, lth );
      initColorPicker( '#zBorderColor', colors, names, lth );
      initColorPicker( '#zPageColor', colors, names, lth );
   }

   function setReusableBlocks( jsonReusable )
   {
      if ( $.isArray( jsonReusable ) ) {
         var list = $("#zReusableBlocks");
         list.find('option:not(:first)').remove(); // wipe out all but the first options
         $.each(jsonReusable, function(index, item) {
            list.append( new Option( item.Name, item.Name ) );
         });
      }
   }

   function setMarketing( jsonMarketing )
   {
      if ( $.isArray( jsonMarketing ) ) {
         var list = $("#zMarketingSection");
         $.each(jsonMarketing, function(index, item) {
            list.append( new Option( item.Name, item.Name ) );
         });
      }
   }

   function setBlockTags( jsonBlockTags ) // g_jsonBlocks
   {
      if ( $.isArray( jsonBlockTags ) ) {
         $.each(jsonBlockTags, function(index, item) {
            g_jsonBlockTags.push( item );
         });
      }
   }

// Initialize everything (first time in).
   scrollbarHeightWidth();  // call the function to set g_scrollbar
   setLLD_sizes();
   $("#zSectionType").prop( 'disabled', true );
   LoadZeidonJsonFromLLD( "mSPLDef" );

   // set initial state.
   var borders = localStorage.getItem( "epamms_graphic_labelborders" ) === "Y" ? true : false;
   $("#labelBorders").prop( "checked", borders );
   var show = localStorage.getItem( "epamms_graphic_showtools" ) === "Y" ? true : false;
   $("#showtools").prop( "checked", show );
   runSlideToolsEffect( show );

   var active = parseInt( localStorage.getItem( "epamms_graphic_accordion" ) ); 
   $("#zaccordion").accordion( "option", "active", active );

   var g_scale = parseFloat( localStorage.getItem( "epamms_graphic_spinstop" ) );
   if ( ! g_scale ) {
      g_scale = 1;
   }
   var spinner = $("#zZoomSpinner").spinner();
   spinner.spinner( "value", g_scale );

/**
var canvas = $('#canvasback')[0];
var ctx = canvas.getContext('2d');
ctx.lineWidth=1;
ctx.strokeStyle="#efe";

function assignToDiv() { // this kind of function you are looking for
   dataUrl = canvas.toDataURL();
// document.getElementById('#label').style.background = "url('+dataUrl+')";
   $('#page')[0].style.background = 'url('+dataUrl+')';
}

function draw() { // replace with your logic
// height:9in;width:8.5in;
   var k;
   for ( k = g_ppiX; k < 8.5 * g_ppiX; k += g_ppiX ) {
      ctx.moveTo( k, 0 );
      ctx.lineTo( k, 9 * g_ppiY );
      ctx.stroke();
   }

   for ( k = g_ppiY; k < 9 * g_ppiY; k += g_ppiY ) {
      ctx.moveTo( 0, k );
      ctx.lineTo( 8.5 * g_ppiX, k );
      ctx.stroke();
   }
**/
/*
   ctx.fillStyle = "rgb(100, 250, 100)";
   ctx.fillRect (10, 10, 35, 30);
   ctx.fillStyle = "rgba(100, 250, 250, 0.5)";
   ctx.fillRect (30, 30, 35, 30);
}
*/
/**
draw();
assignToDiv();
**/


/*
   // cannot get physical dimensions of screen.
   function getPPI() {
      if ( g_ppiX === -1 || g_ppiY === -1 ) {
         var DOM_body = document.getElementsByTagName( 'body' )[0];	
         var DOM_divI = document.createElement( 'div' );
      // var DOM_divM = document.createElement( 'div' );
         DOM_divI.style.height = "1in";
         DOM_divI.style.width = "1in";
      // DOM_divM.style.height = "1cm";
      // DOM_divM.style.width = "1cm";
         DOM_body.appendChild( DOM_divI );
      // DOM_body.appendChild( DOM_divM );
         var ppiX = document.defaultView.getComputedStyle( DOM_divI, null ).getPropertyValue( "width" );
         var ppiY = document.defaultView.getComputedStyle( DOM_divI, null ).getPropertyValue( "height" );
      // var ppcmX = document.defaultView.getComputedStyle( DOM_divM, null ).getPropertyValue( "width" );
      // var ppcmY = document.defaultView.getComputedStyle( DOM_divM, null ).getPropertyValue( "height" );
         DOM_body.removeChild( DOM_divI );
      // DOM_body.removeChild( DOM_divM );
         g_ppiX = parseInt( ppiX );
         g_ppiY = parseInt( ppiY );
      // g_ppcmX = parseInt( ppcmX );
      // g_ppcmY = parseInt( ppcmY );
      }
   }

// $(".scroll-pane").jScrollPane();

   getPPI();
   console.log( "PPI X: " + g_ppiX + "   PPI Y: " + g_ppiY );
   console.log( "Screen Width: " + $(document).width() + "   Screen Height: " + $(document).height() );
// console.log( "PPCM X: " + g_ppcmX + "   PPCM Y: " + g_ppcmY );
// console.log( "Exact X: " + g_ppiX / 2.54 + "   Exact Y: " + g_ppiY / 2.54 );
// console.log( "Round X: " + Math.round( g_ppiX / 2.54 ) + "   Round Y: " + Math.round( g_ppiY / 2.54 ) );
*/

   _AfterPageLoaded();
});
});

/**
 * Equal Heights Plugin
 * Equalize the heights of elements. Great for columns or any elements that need to be the same size (floats, etc).
 *
 * Version 1.0
 * Updated 12/10/2008
 *
 * Copyright (c) 2008 Rob Glazebrook (cssnewbie.com)
 *
 * Usage: $(object).equalHeights([minHeight], [maxHeight]);
 *
 * Example 1: $(".cols").equalHeights(); Sets all columns to the same height.
 * Example 2: $(".cols").equalHeights(400); Sets all cols to at least 400px tall.
 * Example 3: $(".cols").equalHeights(100,300); Cols are at least 100 but no more
 * than 300 pixels tall. Elements with too much content will gain a scrollbar.
 *
 */

(function($) {
   $.fn.equalHeights = function( minHeight, maxHeight ) {
      tallest = (minHeight) ? minHeight : 0;
      this.each( function() {
         if($(this).height() > tallest) {
            tallest = $(this).height();
         }
      });
      if ( (maxHeight) && tallest > maxHeight ) tallest = maxHeight;
      return this.each( function() {
         $(this).height(tallest).css( "overflow", "auto" );
      });
   };

   $.fn.cssInt = function( prop ) {
      return parseInt( this.css( prop ), 10 ) || 0;
   };

   $.fn.makeAbsolute = function( rebase ) {
      return this.each( function() {
         var $el = $(this);
         var pos = $el.position();
         $el.css({ position: "absolute", marginLeft: 0, marginTop: 0, top: pos.top, left: pos.left });
         if ( rebase )
            $el.remove().appendTo( "body" );
      });
   };

})(jQuery);