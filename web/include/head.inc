<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="./css/zeidon_allrelative.css" rel="stylesheet" type="text/css">
<link href="./css/zeidon.css" rel="stylesheet" type="text/css">
<link href="./css/main.css" rel="stylesheet" type="text/css">


<!-- JQuery for Validations-->
<script src="./js/jquery.js" type="text/javascript"></script>
<script src="./js/jquery.maskedinput.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">

function gLogout( )
{
   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.forms[0].zAction.value = "_OnUnload";
      document.forms[0].submit( );
   }
}

jQuery(function($){
   $("#PhoneNumber").mask("999-999-9999",{placeholder:" "});
});
</script>
