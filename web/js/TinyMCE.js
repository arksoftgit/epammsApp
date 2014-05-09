tinymce.create('tinymce.plugins.ePlugin',
{
   createControl: function(n, cm)
   {
     switch (n)
     {
        case 'elistbox':
           var elb = cm.createListBox('elistbox',
           {
              title : 'Keyword Insert',
              onselect : function(v)
              {
                 // tinyMCE.activeEditor.windowManager.alert('Value selected:' + v);
                 tinyMCE.execCommand('mceInsertContent',false,v);
              }
           });

           // Add some values to the list box
           elb.add('Claim', '{{Claim}}');
           elb.add('Surface', '{{Surface}}');
           elb.add('Area of Use', '{{AreaOfUse}}');
           elb.add('Application Type', '{{ApplicationType}}');
           elb.add('Usage', '{{Usage}}');
           elb.add('Product Name', '{{ProductName}}');
           elb.add('Master Product', '{{MasterProduct}}');
           elb.add('Primary Registrant', '{{PrimaryRegistrant}}');
           elb.add('Subregistrant', '{{Subregistrant}}');

           // Return the new listbox instance
           return elb;
     }

     return null; 
   } 
}); 
 
// Register plugin with a short name 
tinymce.PluginManager.add('eKey', tinymce.plugins.ePlugin); 
 
// Initialize TinyMCE with the new plugin and listbox 
tinyMCE.init({
   plugins : '-eKey', // - tells TinyMCE to skip the loading of the plugin 
   mode : "textareas",
	theme : "advanced",
   editor_selector : "mceSimple_zeidon",
   editor_deselector : "mceNoEditor",
   theme_advanced_buttons1 : "elistbox,bold,italic,underline,separator,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,bullist,numlist,|,sub,sup,|,undo,redo,|,forecolor,removeformat", 
	theme_advanced_buttons2 : "",
	theme_advanced_buttons3 : "",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "center",
	entity_encoding : "raw",
	add_unload_trigger : false,
	remove_linebreaks : false,
	inline_styles : false,
	convert_fonts_to_spans : false
});
