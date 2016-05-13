function Test( )
{
   alert("In Test");
}

function OpenFrame( obj, windowname )
{
   alert("Open Frame");
   if ( windowname != "" )
   {
      var NewWin = window.open( windowname );
      NewWin.focus( );
   }
}

function Expand( obj, nbrRpt, columnExpand, startnbrcol, maxnbrcol )
{


  //Expand all divs in this column, hide all the 
  //divs in the other columns.
      //var els = Element.getElementsByClassName(regionTable, 'RegionHeaderColor');

      var divName = "";
      var divNameTitle = "";
      var divNameContent = "";
      var divNameExpand = "";
      var columnHide1;
      var columnHide2;

     if (columnExpand == 1)
     {
        columnHide1 = 2;
        columnHide2 = 3;
     }
     else
     if (columnExpand == 2)
     {
        columnHide1 = 1;
        columnHide2 = 3;
     }
     else
     {
        columnHide1 = 1;
        columnHide2 = 2;
     }

     //obj.style.color='#cc0000';
    
      // I was thinking we could check the width of this div?  If it's wide (like 788) then
      // we know it's expanded and we could contract?

      // What if I have all reports 1 thru ? in column 1 and then ? thru ?? in column 2 etc.
      // then I pass ? or ?? along with the column number.  That way I can simply get elements
      // by id in that column make them a larger width and then 
      
      if (obj.title == 'Expand' ) 
      {

        for (var i = startnbrcol; i <= maxnbrcol; i++) 
        {
          divName        = 'rpt-display-' + i;
          divNameTitle   = 'rpt-display-title-' + i;
          divNameExpand  = 'rpt-display-expand-' + i;
          divNameContent = 'rpt-display-content-' + i;

          document.getElementById(divName).style.width = '790px';
          document.getElementById(divNameExpand).title = 'Undo expand';
          document.getElementById(divNameContent).style.width = '788px';

          document.getElementById(divNameExpand).className = 'region-header-title-contract';
       }
        
        document.getElementById('column-' + columnExpand).style.width = '790px';
        document.getElementById('column-' + columnExpand).style.marginLeft = '7px';
        document.getElementById('column-' + columnHide1).style.marginLeft = '7px';

        document.getElementById('column-' + columnHide1).style.display = 'none';
        document.getElementById('column-' + columnHide2).style.display = 'none';

       
      } 
      else 
      {

        for (var i = startnbrcol; i <= maxnbrcol; i++) 
        {
          divName = 'rpt-display-' + i;
          divNameTitle = 'rpt-display-title-' + i;
          divNameExpand  = 'rpt-display-expand-' + i;
          divNameContent = 'rpt-display-content-' + i;

          document.getElementById(divName).style.width = '260px';
          document.getElementById(divNameExpand).title = 'Expand';
          document.getElementById(divNameContent).style.width = '258px';

          document.getElementById(divNameExpand).className = 'region-header-title-expand';

        }
        
        document.getElementById('column-' + columnExpand).style.width = '260px';
        document.getElementById('column-' + columnExpand).style.marginLeft = (columnExpand == 1) ? '7px' : '5px';
        document.getElementById('column-' + columnHide1).style.marginLeft = (columnHide1 == 1) ? '7px' : '5px';
        document.getElementById('column-' + columnHide1).style.display = '';
        document.getElementById('column-' + columnHide2).style.display = '';
        
    }
  

}

function hideDiv() { 
if (document.getelementbyid) { // DOM3 = IE5, NS6 
document.getelementbyid('hideShow').style.visibility = 'hidden'; 
} 
else { 
if (document.layers) { // Netscape 4 
document.hideShow.visibility = 'hidden'; 
} 
else { // IE 4 
document.all.hideShow.style.visibility = 'hidden'; 
} 
} 
} 

function showDiv() { 
if (document.getelementbyid) { // DOM3 = IE5, NS6 
document.getelementbyid('hideShow').style.visibility = 'visible'; 
} 
else { 
if (document.layers) { // Netscape 4 
document.hideShow.visibility = 'visible'; 
} 
else { // IE 4 
document.all.hideShow.style.visibility = 'visible'; 
} 
} 
} 