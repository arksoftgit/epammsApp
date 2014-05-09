function ShowFormElements( theForm )
{
   var str = "Form Elements: ";
   var name;
   var value;
   var tagName;

   for ( k = 0; k < theForm.length; k++ )
   {
      name = theForm.elements[ k ].name;
      value = theForm.elements[ k ].value;
      tagName = theForm.elements[ k ].tagName;
      str += " \n " + name + "\t\t" + value + "\t\t" + tagName;
   }

   alert( str );
}

// PLEASE NOTE:
// It is recommended that you use a process other than MailTo handle the e-mail process from your web site.
// If you do use MailTo, please encode the included e-mail address(s) to reduce the spam for that address.
// One routine to assist encoding an e-mail address is available at: http://www.ianr.unl.edu/email/encode/
// The MailTo command can do more than enter a single e-mail address in the "Send To" field while activating
// your e-mail program. It can also:
// Feature                                          Syntax
// Address message to multiple recipients           ,   (comma separating e-mail addresses)
// Add entry in the "Subject" field                 ?subject=Subject Field Text
// Add entry in the "Copy To" or "CC" field         ?&cc=id@internet.node
// Add entry in the "Blind Copy To" or "BCC" field  ?&bcc=id@internet.node
// Add entry in the "Body" field                    ?&body=Your message here
// Within the body use "%0A" for a new line,
// Use "%0A%0A" for a new line preceded by a blank line (paragraph).

function EmailWithoutContactEntry( )
{
   if ( _IsDocDisabled( ) == false )
   {
      var szEmailList = "";
      var tds;
      var thisTd;
      var k;

   // _DisableFormElements( true );
   // ShowFormElements( document.wClassDEmailStudents );

      tds = document.getElementsByTagName( "td" );
      for ( k = 0; k < tds.length; k++ )
      {
         thisTd = tds[ k ];
         if ( thisTd.className == "Email" )
         {
            if ( szEmailList != "" )
               szEmailList += ",";

            szEmailList += thisTd.innerText;
         }
      }

      if ( szEmailList != "" )
      {
         // Here is a script demonstrating calling the email client with mailto
         // and populating the message.  Note that problems may occur if the
         // client computer has no default email program specified.
         var thisMLE = document.getElementById( "MLEdit" );
         var eml = document.wClassDEmailStudents.ProfEmail.value;
         var subject = document.wClassDEmailStudents.Subject.value;
         var bcc;
         var sub = "?subject=";
         var bod="&body=";
         var mle = thisMLE.innerText;
         var mle1;

         if ( subject == "" )
            sub += "&nbsp";
         else
            sub += subject;

         while ( mle.search( "\n" ) >= 0 )
         {
            mle1=mle.replace( "\n", "%0a" );
            mle=mle1;
         }

         if ( mle == "" )
            bod += "&nbsp";
         else
            bod += mle;

         if ( szEmailList == "" )
            bcc = "&bcc=" + "&nbsp";
         else
            bcc = "&bcc=" + szEmailList;

         location.href="mailto:" + eml + sub + bcc + bod;
      }
   }
}

