/**
 * Written by Neil Crosby.
 * http://www.workingwith.me.uk/articles/scripting/standardista_table_sorting
 *
 * This module is based on Stuart Langridge's "sorttable" code.  Specifically,
 * the determineSortFunction, sortCaseInsensitive, sortDate, sortNumeric, and
 * sortCurrency functions are heavily based on his code.  This module would not
 * have been possible without Stuart's earlier outstanding work.
 *
 * Use this wherever you want, but please keep this comment at the top of this file.
 *
 * Copyright (c) 2006 Neil Crosby
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Modifications by James "zaydana" Nelson and Daniel Aleksandrow.
 **/
var standardistaTableSorting = {

   that: false,
   isOdd: false,

   sortColumnIndex : -1,
   lastAssignedId : 0,
   newRows: -1,
   lastSortedTable: -1,

   /**
    * Initialises the Standardista Table Sorting module
    **/
   init : function() {
      // first, check whether this web browser is capable of running this script
      if (!document.getElementsByTagName) {
         return;
      }

      this.that = this;

      this.run();
   },

   /**
    * Runs over each table in the document, making it sortable if it has a class
    * assigned named "sortable" and an id assigned.
    **/
   run : function() {
      var tables = document.getElementsByTagName("table");

      for (var i=0; i < tables.length; i++) {
         var thisTable = tables[i];

         if (css.elementHasClass(thisTable, 'sortable')) {
            this.makeSortable(thisTable);
         }
      }
   },

   /**
    * Makes the given table sortable.
    **/
   makeSortable : function(table) {

      // first, check if the table has an id.  if it doesn't, give it one
      if (!table.id) {
         table.id = 'sortableTable'+this.lastAssignedId++;
      }

      // if this table does not have a thead, we don't want to know about it
      if (!table.tHead || !table.tHead.rows || 0 == table.tHead.rows.length) {
         return;
      }

      // we'll assume that the last row of headings in the thead is the row that
      // wants to become clickable
      var row = table.tHead.rows[table.tHead.rows.length - 1];

      for (var i=0; i < row.cells.length; i++) {

         if ( row.cells[i].className != "gridheading" )
         {
            // add to each cell an onClick event which will control the sorting of the table
            row.cells[i].onclick = this.headingClicked;
            row.cells[i].setAttribute('columnId', i);

            var arrowIMG = createElement('img');
            arrowIMG.className = 'tableSortArrow';
            arrowIMG.src = "images/arrow_transparent.png";
            row.cells[i].appendChild(arrowIMG);
         }
      }
   },

   headingClicked: function(e) {

      var that = standardistaTableSorting.that;

      // directly outside it is a td, tr, thead and table
      var td     = this;
      var tr     = td.parentNode;
      var thead  = tr.parentNode;
      var table  = thead.parentNode;

      // if the table we're looking at doesn't have any rows
      // (or only has one) then there's no point trying to sort it
      if (!table.tBodies || table.tBodies[0].rows.length <= 1) {
         return false;
      }

      // the column we want is indicated by td.cellIndex
      var column = td.getAttribute('columnId') || td.cellIndex;
      //var column = td.cellIndex;

      // find out what the current sort order of this column is
      var arrows = css.getElementsByClass(td, 'tableSortArrow', 'img');
      var previousSortOrder = '';
      if (arrows.length > 0) {
         previousSortOrder = arrows[0].getAttribute('sortOrder');
      }

      // work out how we want to sort this column using the data in the first cell
      var row = 1;
      var itm = that.getInnerText(table.tBodies[0].rows[row].cells[column]);
      while (itm=="" || itm.charCodeAt(0)==32)
      {
         row++;
         if (row < table.tBodies[0].rows.length)
            itm = that.getInnerText(table.tBodies[0].rows[row].cells[column]);
         else
            break;
      }

      var sortfn = that.determineSortFunction(itm);

      // if the last column that was sorted was this one, then all we need to
      // do is reverse the sorting on this column
      if (table.id == that.lastSortedTable && column == that.sortColumnIndex) {
         newRows = that.newRows;
         newRows.reverse();
      // otherwise, we have to do the full sort
      } else {
         that.sortColumnIndex = column;
         var newRows = new Array();

         for (var j = 0; j < table.tBodies[0].rows.length; j++) {
            newRows[j] = table.tBodies[0].rows[j];
         }

         newRows.sort(sortfn);
      }

      that.moveRows(table, newRows);
      that.newRows = newRows;
      that.lastSortedTable = table.id;

      // now, give the user some feedback about which way the column is sorted

      // first, get rid of any arrows in any heading cells
      var arrows = css.getElementsByClass(tr, 'tableSortArrow', 'img');
      for (var j = 0; j < arrows.length; j++) {
         var arrowParent = arrows[j].parentNode;
         arrowParent.removeChild(arrows[j]);

         if (arrowParent != td) {
                arrowIMG = createElement("img");
                arrowIMG.src = "images/arrow_transparent.png";
                arrowParent.appendChild(arrowIMG);
                arrowIMG.className = 'tableSortArrow';
                arrowParent.appendChild(arrowIMG);
         }
      }

      // now, add back in some feedback
      var arrowIMG = createElement('img');
      arrowIMG.className = 'tableSortArrow';
      if (null == previousSortOrder || '' == previousSortOrder || 'DESC' == previousSortOrder) {
            arrowIMG.src = "images/arrow_up.png";
            arrowIMG.setAttribute('sortOrder', 'ASC');
      } else {
            arrowIMG.src = "images/arrow_down.png";
            arrowIMG.setAttribute('sortOrder', 'DESC');
      }

      td.appendChild(arrowIMG);

      return false;
   },

   getInnerText : function(el) {

      if ('string' == typeof el || 'undefined' == typeof el) {
         return el;
      }

      if (el.innerText) {
         return el.innerText;  // Not needed but it is faster
      }

      var str = el.getAttribute('standardistaTableSortingInnerText');
      if (null != str && '' != str) {
         return str;
      }
      str = '';

      var cs = el.childNodes;
      var l = cs.length;
      for (var i = 0; i < l; i++) {
         // 'if' is considerably quicker than a 'switch' statement,
         // in Internet Explorer which translates up to a good time
         // reduction since this is a very often called recursive function
         if (1 == cs[i].nodeType) { // ELEMENT NODE
            str += this.getInnerText(cs[i]);
            break;
         } else if (3 == cs[i].nodeType) { //TEXT_NODE
            str += cs[i].nodeValue;
            break;
         }
      }

      // set the innertext for this element directly on the element
      // so that it can be retrieved early next time the innertext
      // is requested
      el.setAttribute('standardistaTableSortingInnerText', str);

      return str;
   },

   determineSortFunction : function(itm) {

      var sortfn = this.sortCaseInsensitive;

      if (itm.match(/^\d\d[\/-]\d\d[\/-]\d\d\d\d$/)) {
         sortfn = this.sortDate;
      }
      else
      if (itm.match(/^\d\d[\/-]\d\d[\/-]\d\d$/)) {
         sortfn = this.sortDate;
      }
      else
      if (itm.match(/^[£$]/)) {
         sortfn = this.sortCurrency;
      }
      else
      if (itm.match(/^[\d\.]+$/)) {
         sortfn = this.sortNumeric;
      }
      else
      if (itm.match(/^([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])$/)) {
         sortfn = this.sortIP;
      }
      else
      if (itm.length <= 11 &&
          (itm.match("Freshman") || itm.match("Freshman(2)") || itm.match("Sophomore") || itm.match("Junior") || itm.match("Senior") ||
           itm.match("5 YR Senior") || itm.match("Deg Alumni") || itm.match("Graduate"))) {
         sortfn = this.sortClassification;
      }
      else
      if (itm.length > 0 && itm.length <= 2 )  // last check on purpose!!!
      {
         var sign = "+";
         var s = itm.substr(0,1);
         s = s.toUpperCase();

         if ( itm.length == 2 )
            sign = itm.substr(1,1);

         if ( sign.charCodeAt(0)==43 || sign.charCodeAt(0)==45) // sign.match("+") || sign.match("-")) &&
         {
            if (s.match("A") || s.match("B") || s.match("C") || s.match("D") || s.match("F") || s.match("S"))
            {
               sortfn = this.sortGrade;
            }
         }
      }

      return sortfn;
   },

   sortCaseInsensitive : function(a,b) {
      var that = standardistaTableSorting.that;

      var aa = that.getInnerText(a.cells[that.sortColumnIndex]).toLowerCase();
      var bb = that.getInnerText(b.cells[that.sortColumnIndex]).toLowerCase();
      if (aa==bb) {
         return 0;
      } else if (aa<bb) {
         return -1;
      } else {
         return 1;
      }
   },

   sortClassification : function(a,b) {
      var that = standardistaTableSorting.that;

      var aa = that.getInnerText(a.cells[that.sortColumnIndex]);
      var bb = that.getInnerText(b.cells[that.sortColumnIndex]);
      if (aa==bb)
      {
         return 0;
      }
      else
      if (aa=="" || aa==" " || aa=="Freshman")
      {
         return -1;
      }
      else
      if (aa=="Freshman(2)" && bb!="Freshman")
      {
         return -1;
      }
      else
      if (aa=="Sophomore" && bb!="Freshman"&& bb!="Freshman(2)")
      {
         return -1;
      }
      else
      if (aa=="Junior" && bb!="Freshman"&& bb!="Freshman(2)" && bb!="Sophomore")
      {
         return -1;
      }
      else
      if (aa=="Senior" && bb!="Freshman"&& bb!="Freshman(2)" && bb!="Sophomore" && bb!="Junior")
      {
         return -1;
      }
      else
      if (aa=="Deg Alumni" && bb!="Freshman"&& bb!="Freshman(2)" && bb!="Sophomore" && bb!="Junior" && bb!="Senior")
      {
         return -1;
      }
      else
      if (aa=="Graduate" && bb!="Freshman"&& bb!="Freshman(2)" && bb!="Sophomore" && bb!="Junior" && bb!="Senior" && bb!="Deg Alumni")
      {
         return -1;
      }
      else
      {
         return 1;
      }
   },

   sortGrade : function(a,b) {
      var that = standardistaTableSorting.that;
      var aa = that.getInnerText(a.cells[that.sortColumnIndex]).toLowerCase();
      var bb = that.getInnerText(b.cells[that.sortColumnIndex]).toLowerCase();

      if (aa==bb)
         return 0;

      var a1 = aa.substr(0,1);
      var a2 = aa.substr(1,1);
      var b1 = bb.substr(0,1);
      var b2 = bb.substr(1,1);

      if (aa=="undefined")
         return -1

      if (bb=="undefined")
         return 1

      if (a1=="undefined" || a1=="" || a1==" ")
         return -1

      if (b1=="undefined" || b1=="" || b1==" ")
         return 1

      if ( a1 == b1 )
      {
         if ( a2 == '+' || b2 == '-' )
            return 1;
         else
      // if ( a2 == '-' || b2 == '+' )
            return -1;
      }
      else
      {
         if (a1 < b1)  // grades are upside down
            return 1;
         else
            return -1;
      }
   },

   sortDate : function(a,b) {
      var that = standardistaTableSorting.that;

      // y2k notes: two digit years less than 50 are treated as 20XX, greater than 50 are treated as 19XX
      var aa = that.getInnerText(a.cells[that.sortColumnIndex]);
      var bb = that.getInnerText(b.cells[that.sortColumnIndex]);

      var dt1, dt2, yr = -1;

      if (aa.length == 10) {
         dt1 = aa.substr(6,4)+aa.substr(3,2)+aa.substr(0,2);
      } else {
         yr = aa.substr(6,2);
         if (parseInt(yr) < 50) {
            yr = '20'+yr;
         } else {
            yr = '19'+yr;
         }
         dt1 = yr+aa.substr(3,2)+aa.substr(0,2);
      }

      if (bb.length == 10) {
         dt2 = bb.substr(6,4)+bb.substr(3,2)+bb.substr(0,2);
      } else {
         yr = bb.substr(6,2);
         if (parseInt(yr) < 50) {
            yr = '20'+yr;
         } else {
            yr = '19'+yr;
         }
         dt2 = yr+bb.substr(3,2)+bb.substr(0,2);
      }

      if (dt1==dt2) {
         return 0;
      } else if (dt1<dt2) {
         return -1;
      }
      return 1;
   },

   sortCurrency : function(a,b) {
      var that = standardistaTableSorting.that;

      var aa = that.getInnerText(a.cells[that.sortColumnIndex]).replace(/[^0-9.]/g,'');
      var bb = that.getInnerText(b.cells[that.sortColumnIndex]).replace(/[^0-9.]/g,'');
      return parseFloat(aa) - parseFloat(bb);
   },

   sortNumeric : function(a,b) {
      var that = standardistaTableSorting.that;

      var aa = parseFloat(that.getInnerText(a.cells[that.sortColumnIndex]));
      if (isNaN(aa)) {
         aa = 0;
      }
      var bb = parseFloat(that.getInnerText(b.cells[that.sortColumnIndex]));
      if (isNaN(bb)) {
         bb = 0;
      }
      return aa-bb;
   },

   makeStandardIPAddress : function(val) {
      var vals = val.split('.');

      for (x in vals) {
         val = vals[x];

         while (3 > val.length) {
            val = '0'+val;
         }
         vals[x] = val;
      }

      val = vals.join('.');

      return val;
   },

   sortIP : function(a,b) {
      var that = standardistaTableSorting.that;

      var aa = that.makeStandardIPAddress(that.getInnerText(a.cells[that.sortColumnIndex]).toLowerCase());
      var bb = that.makeStandardIPAddress(that.getInnerText(b.cells[that.sortColumnIndex]).toLowerCase());
      if (aa==bb) {
         return 0;
      } else if (aa<bb) {
         return -1;
      } else {
         return 1;
      }
   },

   moveRows : function(table, newRows) {
      var odd = false;

      // We appendChild rows that already exist to the tbody, so it moves them rather than creating new ones
      for (var i=0;i<newRows.length;i++) {
         var rowItem = newRows[i];

         if(odd) {
            css.addClassToElement(rowItem, 'odd');
         } else {
            css.removeClassFromElement(rowItem, 'odd');
         }
         odd = !odd;

         table.tBodies[0].appendChild(rowItem);
      }
   }
}

function standardistaTableSortingInit() {
   standardistaTableSorting.init();
   _AfterPageLoaded();
}

addEvent(window, 'load', standardistaTableSortingInit);
