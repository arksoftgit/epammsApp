// ===================================================================
// Author: Matt Kruse <matt@mattkruse.com>
// WWW: http://www.mattkruse.com/
//
// NOTICE: You may use this code for any purpose, commercial or
// private, without any further permission from the author. You may
// remove this notice from your final code if you wish, however it is
// appreciated by the author if at least my web site address is kept.
//
// You may *NOT* re-distribute this code in any way except through its
// use. That means, you can include it in your product, or your web
// site, or any other form where the code is actually being used. You
// may not put the plain javascript up on your site for download or
// include it in your javascript libraries for download.
// If you wish to share this code with others, please just point them
// to the URL instead.
// Please DO NOT link directly to my .js files from your site. Copy
// the files to your server and use them there. Thank you.
// ===================================================================

function LTrim(str){if(str==null){return null;}for(var i=0;str.charAt(i)==" ";i++);return str.substring(i,str.length);}
function RTrim(str){if(str==null){return null;}for(var i=str.length-1;str.charAt(i)==" ";i--);return str.substring(0,i+1);}
function Trim(str){return LTrim(RTrim(str));}
function LTrimAll(str){if(str==null){return str;}for(var i=0;str.charAt(i)==" " || str.charAt(i)=="\n" || str.charAt(i)=="\t";i++);return str.substring(i,str.length);}
function RTrimAll(str){if(str==null){return str;}for(var i=str.length-1;str.charAt(i)==" " || str.charAt(i)=="\n" || str.charAt(i)=="\t";i--);return str.substring(0,i+1);}
function TrimAll(str){return LTrimAll(RTrimAll(str));}
function isNull(val){return(val==null);}
function isBlank(val){if(val==null){return true;}for(var i=0;i<val.length;i++){if((val.charAt(i)!=' ')&&(val.charAt(i)!="\t")&&(val.charAt(i)!="\n")&&(val.charAt(i)!="\r")){return false;}}return true;}
function isInteger(val){if(isBlank(val)){return false;}for(var i=0;i<val.length;i++){if(!isDigit(val.charAt(i))){return false;}}return true;}
function isNumeric(val){return(parseFloat(val,10)==(val*1));}
function isArray(obj){return(typeof(obj.length)=="undefined")?false:true;}
function isDigit(num){if(num.length>1){return false;}var string="1234567890";if(string.indexOf(num)!=-1){return true;}return false;}
function setNullIfBlank(obj){if(isBlank(obj.value)){obj.value="";}}
function setFieldsToUpperCase(){for(var i=0;i<arguments.length;i++){arguments[i].value = arguments[i].value.toUpperCase();}}
function disallowBlank(obj){var msg=(arguments.length>1)?arguments[1]:"";var dofocus=(arguments.length>2)?arguments[2]:false;if(isBlank(getInputValue(obj))){if(!isBlank(msg)){alert(msg);}if(dofocus){if(isArray(obj) &&(typeof(obj.type)=="undefined")){obj=obj[0];}if(obj.type=="text"||obj.type=="textarea"||obj.type=="password"){obj.select();}obj.focus();}return true;}return false;}
function disallowModify(obj){var msg=(arguments.length>1)?arguments[1]:"";var dofocus=(arguments.length>2)?arguments[2]:false;if(getInputValue(obj)!=getInputDefaultValue(obj)){if(!isBlank(msg)){alert(msg);}if(dofocus){if(isArray(obj) &&(typeof(obj.type)=="undefined")){obj=obj[0];}if(obj.type=="text"||obj.type=="textarea"||obj.type=="password"){obj.select();}obj.focus();}setInputValue(obj,getInputDefaultValue(obj));return true;}return false;}
function commifyArray(obj,delimiter){if(typeof(delimiter)=="undefined" || delimiter==null){delimiter = ",";}var s="";if(obj==null||obj.length<=0){return s;}for(var i=0;i<obj.length;i++){s=s+((s=="")?"":delimiter)+obj[i].toString();}return s;}
function getSingleInputValue(obj,use_default,delimiter){switch(obj.type){case 'radio': case 'checkbox': return(((use_default)?obj.defaultChecked:obj.checked)?obj.value:null);case 'text': case 'hidden': case 'textarea': return(use_default)?obj.defaultValue:obj.value;case 'password': return((use_default)?null:obj.value);case 'select-one':
if(obj.options==null){return null;}if(use_default){var o=obj.options;
for(var i=0;i<o.length;i++){if(o[i].defaultSelected){return o[i].value;}}
return o[0].value;}if(obj.selectedIndex<0){return null;}return(obj.options.length>0)?obj.options[obj.selectedIndex].value:null;case 'select-multiple':
if(obj.options==null){return null;}var values=new Array();for(var i=0;i<obj.options.length;i++){if((use_default&&obj.options[i].defaultSelected)||(!use_default&&obj.options[i].selected)){values[values.length]=obj.options[i].value;}}return(values.length==0)?null:commifyArray(values,delimiter);}alert("FATAL ERROR: Field type "+obj.type+" is not supported for this function");return null;}
function getSingleInputText(obj,use_default,delimiter){switch(obj.type){case 'radio': case 'checkbox':   return "";case 'text': case 'hidden': case 'textarea': return(use_default)?obj.defaultValue:obj.value;case 'password': return((use_default)?null:obj.value);case 'select-one':
if(obj.options==null){return null;}if(use_default){var o=obj.options;for(var i=0;i<o.length;i++){if(o[i].defaultSelected){return o[i].text;}}return o[0].text;}if(obj.selectedIndex<0){return null;}return(obj.options.length>0)?obj.options[obj.selectedIndex].text:null;case 'select-multiple':
if(obj.options==null){return null;}var values=new Array();for(var i=0;i<obj.options.length;i++){if((use_default&&obj.options[i].defaultSelected)||(!use_default&&obj.options[i].selected)){values[values.length]=obj.options[i].text;}}return(values.length==0)?null:commifyArray(values,delimiter);}alert("FATAL ERROR: Field type "+obj.type+" is not supported for this function");return null;}
function setSingleInputValue(obj,value){switch(obj.type){case 'radio': case 'checkbox': if(obj.value==value){obj.checked=true;return true;}else{obj.checked=false;return false;}case 'text': case 'hidden': case 'textarea': case 'password': obj.value=value;return true;case 'select-one': case 'select-multiple':
var o=obj.options;for(var i=0;i<o.length;i++){if(o[i].value==value){o[i].selected=true;}else{o[i].selected=false;}}return true;}alert("FATAL ERROR: Field type "+obj.type+" is not supported for this function");return false;}
function getInputValue(obj,delimiter){var use_default=(arguments.length>2)?arguments[2]:false;if(isArray(obj) &&(typeof(obj.type)=="undefined")){var values=new Array();for(var i=0;i<obj.length;i++){var v=getSingleInputValue(obj[i],use_default,delimiter);if(v!=null){values[values.length]=v;}}return commifyArray(values,delimiter);}return getSingleInputValue(obj,use_default,delimiter);}
function getInputText(obj,delimiter){var use_default=(arguments.length>2)?arguments[2]:false;if(isArray(obj) &&(typeof(obj.type)=="undefined")){var values=new Array();for(var i=0;i<obj.length;i++){var v=getSingleInputText(obj[i],use_default,delimiter);if(v!=null){values[values.length]=v;}}return commifyArray(values,delimiter);}return getSingleInputText(obj,use_default,delimiter);}
function getInputDefaultValue(obj,delimiter){return getInputValue(obj,delimiter,true);}
function getInputDefaultText(obj,delimiter){return getInputText(obj,delimiter,true);}
function isChanged(obj){return(getInputValue(obj)!=getInputDefaultValue(obj));}
function isChangedComboBox(obj){return(getInputText(obj)!=getInputDefaultText(obj));}
function setInputValue(obj,value){var use_default=(arguments.length>1)?arguments[1]:false;if(isArray(obj)&&(typeof(obj.type)=="undefined")){for(var i=0;i<obj.length;i++){setSingleInputValue(obj[i],value);}}else{setSingleInputValue(obj,value);}}
function isFormModified(theform,hidden_fields,ignore_fields){if(hidden_fields==null){hidden_fields="";}if(ignore_fields==null){ignore_fields="";}var hiddenFields=new Object();var ignoreFields=new Object();var i,field;var hidden_fields_array=hidden_fields.split(',');for(i=0;i<hidden_fields_array.length;i++){hiddenFields[Trim(hidden_fields_array[i])]=true;}var ignore_fields_array=ignore_fields.split(',');for(i=0;i<ignore_fields_array.length;i++){ignoreFields[Trim(ignore_fields_array[i])]=true;}for(i=0;i<theform.elements.length;i++){var changed=false;var name=theform.elements[i].name;if(!isBlank(name)){var type=theform.elements[i].type;if(!ignoreFields[name]){if(type=="hidden"&&hiddenFields[name]){changed=isChanged(theform[name]);}else if(type=="hidden"){changed=false;}else{changed=isChanged(theform[name]);}}}if(changed){return true;}}return false;}

function insertAtCaret( textbox, text )
{   
   if ( document.selection )
   {   
      textbox.focus( );   
      var orig = textbox.value.replace( /\r\n/g, "\n" );   
      var range = document.selection.createRange( );   

      if ( range.parentElement( ) != textbox )
      {   
         return false;   
      }   
 
      range.text = text;   
          
      var actual = tmp = textbox.value.replace( /\r\n/g, "\n" );   
 
      for ( var diff = 0; diff < orig.length; diff++ )
      {   
         if ( orig.charAt( diff ) != actual.charAt( diff ) )
            break;   
      }   
 
      for ( var index = 0, start = 0;
            tmp.match( text ) && (tmp = tmp.replace( text, "" )) && index <= diff;
            index = start + text.length )
      {   
         start = actual.indexOf(text, index);   
      }   
   }
   else
   if ( textbox.selectionStart )
   {   
      var start = textbox.selectionStart;   
      var end   = textbox.selectionEnd;   
 
      textbox.value = textbox.value.substr( 0, start ) + text + textbox.value.substr( end, textbox.value.length );   
   }   
        
   if ( start != null )
   {   
      setCaretTo( textbox, start + text.length );   
   }
   else
   {   
      textbox.value += text;   
   }   
}   

function setCaretTo( textbox, pos )
{   
   if ( textbox.createTextRange )
   {   
      var range = textbox.createTextRange( );   
      range.move( 'character', pos );   
      range.select( );   
   }
   else
   if ( textbox.selectionStart )
   {   
      textbox.focus( );   
      textbox.setSelectionRange( pos, pos );   
   }   
}  

// [dFilter] - A Numerical Input Mask for JavaScript
// Written By Dwayne Forehand - March 27th, 2003
// Please reuse & redistribute while keeping this notice.

// Sets the caret (cursor) position of the specified text field.
// Valid positions are 0-textbox.length.
function doSetCaretPosition( textbox, nCaretPos )
{
   if ( document.selection ) // IE Support
   { 
      // Set focus on the element
      textbox.focus( );

      // Create empty selection range
      var oSel = document.selection.createRange( );

      // Move selection start and end to 0 position
      oSel.moveStart( 'character', -textbox.value.length );

      // Move selection start and end to desired position
      oSel.moveStart( 'character', nCaretPos );
      oSel.moveEnd( 'character', nCaretPos );
   // oSel.moveEnd( 'character', 0 );
      oSel.select( );
   }
   else // Firefox support
   {
      if ( textbox.selectionStart || textbox.selectionStart == '0' )
      {
         textbox.selectionStart = nCaretPos;
         textbox.selectionEnd = nCaretPos;
         textbox.focus( );
      }
   }
}

//  Returns the caret (cursor) position of the specified text field.
//  Return value range is 0-textbox.length.
function doGetCaretPosition( textbox )
{
   var nCaretPos = 0; // initialize

   if ( document.selection ) // IE Support
   {
      // Set focus on the element
      textbox.focus( );

      // To get cursor position, get empty selection range
      var oSel = document.selection.createRange( );
   // var oSelLth = document.selection.createRange().text.length;

      // Move selection start to 0 position
      oSel.moveStart( 'character', -textbox.value.length );

      // The caret position is selection length
      nCaretPos = oSel.text.length; // - oSelLth;
   }
   else // Firefox support
   {
      if ( textbox.selectionStart || textbox.selectionStart == '0' )
         nCaretPos = textbox.selectionStart;
   }

   return( nCaretPos ); // result
}


function dFilterStrip( dFilterTemp, dFilterMask )
{
   var dFilterStep;

   dFilterMask = replace( dFilterMask, '#', '' );
   for ( dFilterStep = 0; dFilterStep < dFilterMask.length++; dFilterStep++ )
   {
      dFilterTemp = replace( dFilterTemp, dFilterMask.substring( dFilterStep, dFilterStep + 1 ), '' );
   }

   return dFilterTemp;
}

function dFilterMax( dFilterMask )
{
   var dFilterStep;
   var dFilterTemp = dFilterMask;

   for ( dFilterStep = 0; dFilterStep < (dFilterMask.length + 1); dFilterStep++ )
   {
      if ( dFilterMask.charAt( dFilterStep ) != '#' )
      {
         dFilterTemp = replace( dFilterTemp, dFilterMask.charAt( dFilterStep ), '' );
      }
   }

   return dFilterTemp.length;
}

function dFilter( key, textbox, dFilterMask )
{
   var dFilterStep;
   var dFilterNbr = dFilterStrip( textbox.value, dFilterMask );
   var nCaretPos = doGetCaretPosition( textbox );

   if ( key == 9 )
   {
      return true;
   }
   else
   if ( key == 8 && dFilterNbr.length != 0 )
   {
      dFilterNbr = dFilterNbr.substring( 0, dFilterNbr.length - 1 );
   }
   else
   if ( ((key > 47 && key < 58) || (key > 95 && key < 106)) && dFilterNbr.length < dFilterMax( dFilterMask ) )
   {
     dFilterNbr = dFilterNbr + String.fromCharCode( key );
   }

   var dFilterFinal = '';

   if ( key == 8 || key == 46 )
   {
   // alert( "Key: " + key + "   Mask: " + dFilterMask + "   Value: " + textbox.value + "   Nbr Lth: " + dFilterNbr.length + "   Caret: " + nCaretPos );
      if ( dFilterNbr.length == 0 )
      {
         textbox.value = dFilterFinal;
         return true;
      }
   }

   for ( dFilterStep = 0; dFilterStep < dFilterMask.length; dFilterStep++ )
   {
      if ( dFilterMask.charAt( dFilterStep ) == '#' )
      {
         if ( dFilterNbr.length != 0 )
         {
            dFilterFinal = dFilterFinal + dFilterNbr.charAt( 0 );
            dFilterNbr = dFilterNbr.substring( 1, dFilterNbr.length );
         }
         else
         {
            dFilterFinal = dFilterFinal + "";
         }
      }
      else
      if ( dFilterMask.charAt( dFilterStep ) != '#' )
      {
         dFilterFinal = dFilterFinal + dFilterMask.charAt( dFilterStep );
      }

   // dFilterTemp = replace( dFilterTemp, dFilterMask.substring( dFilterStep, dFilterStep + 1 ), '' );
   }

   textbox.value = dFilterFinal;
// doSetCaretPosition( textbox, nCaretPos );

// return true;
   return false; // the difference between returning true and false is that false seems to work?
}

function replace( fullString, text, byte ) // replaces text with byte in string
{
   var strLth = fullString.length;
   var txtLth = text.length;

   if ( (strLth == 0) || (txtLth == 0) )
      return fullString;

   var i = fullString.indexOf( text );
   if ( (i == 0) && (text != fullString.substring( 0, txtLth )) )
      return fullString;

   if ( i == -1 )
      return fullString;

   var newstr = fullString.substring( 0, i ) + byte;

   if ( i + txtLth < strLth )
      newstr += replace( fullString.substring( i + txtLth, strLth ), text, byte );

   return newstr;
}

// Javascript Numeric EditMask
// Written By John McGlothlin - Patoooey@optonline.net
// April 7th, 2004

// simple RegEx patterns to make life easy (include tab as valid even though it cannot occur).
var reOneOrMoreDigits = /[\d+\t]/;
var reNoDigits = /[^\d\t]/gi;

function doMask( textbox )
{
   var keyCode = event.which ? event.which : event.keyCode;
// alert( "Key: " + keyCode );

   // enter, backspace, delete, tab, left arrow and right arrow keys are shipped straight thru
   if ( keyCode == 13 || keyCode == 8 || keyCode == 9 || keyCode == 46 || keyCode == 37 || keyCode == 39 )
   {
      return true;
   }

   // get character from keyCode ... deals with the "Numeric KeyPad" keyCodes so that keypad can be used
   var keyCharacter = cleanKeyCode( keyCode );

   // simple Regex to check if key is a digit
   if ( reOneOrMoreDigits.test( keyCharacter ) == false )
   {
      return false;
   }

   // grab the textbox value and the mask
   var val = textbox.value;
   var mask = textbox.mask;
   var nCaretPos = doGetCaretPosition( textbox );
// alert( "(1) Key: " + keyCharacter + "   Value: " + val + "   Caret: " + nCaretPos );

   // Set caret position to point to a numeric if possible.
   while ( nCaretPos < val.length && reOneOrMoreDigits.test( val.charAt( nCaretPos ) ) == false )
      nCaretPos++;

   if ( nCaretPos >= mask.length )
   {
      nCaretPos--;
      while ( nCaretPos > 0 && mask.charAt( nCaretPos ) != "#" )
         nCaretPos--;
   }

   // We are now assured that the caret position is within mask range.
   // Add current keystroke as a tab character (to be replaced later).
   if ( nCaretPos < val.length )
   {
      var val1 = val.substring( 0, nCaretPos );
      var val2 = val.substring( nCaretPos, val.length );
      var k;

      if ( val.length >= mask.length )
      {
         for ( k = 0; k < val2.length; k++ )
         {
            if ( reOneOrMoreDigits.test( val2.charAt( k ) ) == true )
               break;
         }

         if ( k < val2.length )
         {
            var val21 = val2.substring( 0, k );
            var val22 = val2.substring( k + 1, val2.length );
            val2 = val21 + "\t" + val22;
         }
         else
         {
            val2 = "\t" + val2.substring( 1, val2.length );
         }

         val = val1 + val2;
      }
      else
         val = val1 + "\t" + val2;
   }
   else
   {
      val += "\t";
   }

   // Get value minus any masking by removing all non-numerics.
   var temp = val.replace( reNoDigits, '' );

   // Replace the tab with the current keystroke.
   k = temp.indexOf( "\t" );
   if ( k >= 0 )
      val = temp.replace( /\t/, keyCharacter );
   else
      val = temp;

// alert( "(2) Key: " + keyCharacter + "   Value: " + val + "   Caret: " + nCaretPos );

   // Mask it ... val holds the existing TextBox.value + tab in place of the current keystroke.
   textbox.value = val.maskValue( mask );
   if ( k >= 0 )
   {
      nCaretPos++;

      // Set caret position to point to a numeric if possible.
      while ( nCaretPos < textbox.value.length && reOneOrMoreDigits.test( textbox.value.charAt( nCaretPos ) ) == false )
         nCaretPos++;
   }

// alert( "(3) Key: " + keyCharacter + "   Value: " + textbox.value + "   Caret: " + nCaretPos );

   if ( nCaretPos >= mask.length )
   {
      nCaretPos = mask.length;

      // Set caret position to point to a numeric if possible.
      while ( nCaretPos > 0 && reOneOrMoreDigits.test( textbox.value.charAt( nCaretPos - 1 ) ) == false )
         nCaretPos--;
   }

   setCaretTo( textbox, nCaretPos );

   return false;
}

// puts starting chars in field
function onFocusMask( textbox )
{
   var val = textbox.value;
   var mask = textbox.mask;

   if ( val.length == 0 || val == null )
   {
      var k = mask.indexOf( '#' );

      textbox.value = mask.substring( 0, k );
   }

   setCaretAtEnd( textbox );

   // set just in case.
   textbox.maxlength = mask.length;
}

// blank field if no digits entered
function onBlurMask( textbox )
{
   var val = textbox.value;

   // if no digits....nada entered.....blank it.
   if ( reOneOrMoreDigits.test( val ) == false )
   {
      textbox.value = '';
   }
}

String.prototype.maskValue = function( mask )
{
   var retVal = mask;
   var val = this;

   // loop thru mask and replace #'s with current value one at a time
   // better way of doing this ???

   for ( var k = 0; k < val.length; k++ )
   {
      retVal = retVal.replace( /#/i, val.charAt( k ) );
   }

   // get rid of rest of #'s
   retVal = retVal.replace( /#/gi, "" );
   return retVal;
}

// The Numeric KeyPad returns keyCodes that ain't all that workable.
// ie: KeyPad '1' returns keyCode 97 which String.fromCharCode converts to an '1'.
// Cheesy way to allow the Numeric KeyPad to be used.
function cleanKeyCode( key )
{
   switch( key )
   {
      case 96: return "0"; break;
      case 97: return "1"; break;
      case 98: return "2"; break;
      case 99: return "3"; break;
      case 100: return "4"; break;
      case 101: return "5"; break;
      case 102: return "6"; break;
      case 103: return "7"; break;
      case 104: return "8"; break;
      case 105: return "9"; break;
      default: return String.fromCharCode( key ); break;
   }
}

// From: http://www.faqts.com/knowledge_base/view.phtml/aid/1159/fid/130
function setCaretAtEnd( textbox )
{
  if ( textbox.createTextRange )
  {
    var r = textbox.createTextRange( );
    r.moveStart( 'character', textbox.value.length );
    r.collapse( );
    r.select( );
  }
}