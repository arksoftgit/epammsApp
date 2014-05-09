ClickNEdit =
{
   ids : [],

   init: function ()
   {
      var t = this,
      wo = window.onload;

      window.onload = function ()
      {
         if (typeof (wo) == "function")
         {
            wo();
         }

         t.setupEditors();
      };
   },

   setupEditors: function ()
   {
      var t = this,
          domu = document.onmouseup,
          el = this.getElementsByClassName("editabletinymce"),
          i;

      for (i = 0; i < el.length; i++)
      {
         el[i].id = "clicknedit_editor_" + i;
         t.ids.push(el[i].id);
      }

      tinyMCE.init(
      {
         mode : "exact",
         elements : t.ids.join(","),
         theme : "advanced",
         language : "en",
         plugins : "table,inlinepopups,searchreplace,paste",
         theme_advanced_buttons1 : "cut,copy,paste,|,undo,redo,|,search,replace,|,tablecontrols,|,charmap",
         theme_advanced_buttons2 : "styleselect,formatselect,|,bold,italic,removeformat,|,bullist,numlist,|,sub,sup,|,link,unlink,image,|,visualaid,cleanup,code",
         theme_advanced_buttons3 : "",
         theme_advanced_buttons4 : "",
         theme_advanced_toolbar_location : "top",
         theme_advanced_toolbar_align : "left",
         theme_advanced_statusbar_location : "bottom",
         setup: function (ed)
                {
                  ed.onPostRender.add(function(ed, o) { ed.hide(); });
                }
      });

      // Where has the click occured?
      document.onmouseup = function (e)
      {
         var el, found, i;

         if (typeof (domu) == "function")
         {
            domu(e);
         }

         e = e || window.event;
         el = e.target || e.srcElement;

         while (el.parentNode && el != document.body && !found)
         {
            for (i = 0; i < t.ids.length; i++)
            {
               if (el.id && (// editable area or inside related editor?
                             el.id == t.ids[i] || el.id == t.ids[i] + "_parent"))
               {
                  found = true;
               }
            }

            if (!found)
            {
               el = el.parentNode;
            }
         }

         if (!found)
         {
            t.hideAllEditors();
         }

         if (found && !el.id.match(/_parent/))
         {
            t.hideAllEditors();
            tinyMCE.get(el.id).show();
         }
      }
   },

   hideAllEditors: function ()
   {
      var t = this, i;

      tinyMCE.triggerSave();
      for (i = 0; i < t.ids.length; i++)
      {
         tinyMCE.get(t.ids[i]).hide();
      }
   },

   getElementsByClassName: function (c, el)
   {
      el = el || document;

      var r = new RegExp("(^|\\s)" + c + "(\\s|$)"),
          all = el.getElementsByTagName("*"),
          f = new Array(),
          i;

      for (i = 0; i < all.length; i++)
      {
         if (all[i] && all[i].className && all[i].className.match(r))
         {
            f.push(all[i]);
         }
      }

      return f;
   }
}

ClickNEdit.init();