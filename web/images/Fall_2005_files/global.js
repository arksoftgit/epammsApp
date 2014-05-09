var root = '/';
//var root = '/www3/';
//var root = '/public/!enc/newsite/'
//var root = '/wwwroot/';

//prospstudents
var prospstudentson = new Image();
var prospstudentsoff = new Image();
/*prospstudentson.src = root + 'images/header/navbar/prospstudents_on.gif';
prospstudentsoff.src = root + 'images/header/navbar/prospstudents_off.gif';*/
prospstudentson.src = root + 'images/header/navbar/undergrad_admissions_on.gif';
prospstudentsoff.src = root + 'images/header/navbar/undergrad_admissions_off.gif';

//undergrad
/*var undergradon = new Image();
var undergradoff = new Image();
undergradon.src = rot + 'images/header/navbar/prospstudents_on.gif';
undergradoff.src = root + 'images/header/navbar/prospstudents_off.gif';*/

//adultstudies
/*var adultstudieson = new Image();
var adultstudiesoff = new Image();
adultstudieson.src = root + 'images/header/navbar/adultstudies_on.gif';
adultstudiesoff.src = root + 'images/header/navbar/adultstudies_off.gif';*/

//adult and grad studies
var adult_grad_studieson = new Image();
var adult_grad_studiesoff = new Image();
adult_grad_studieson.src = root + 'images/header/navbar/adult_grad_studies_on.gif';
adult_grad_studiesoff.src = root + 'images/header/navbar/adult_grad_studies_off.gif';

//alumni
var alumnion = new Image();
var alumnioff = new Image();
alumnion.src = root + 'images/header/navbar/alumni_on.gif';
alumnioff.src = root + 'images/header/navbar/alumni_off.gif';

//parentsfamilies
/*var parentsfamilieson = new Image();
var parentsfamiliesoff = new Image();
parentsfamilieson.src = root + 'images/header/navbar/parentsfamilies_on.gif';
parentsfamiliesoff.src = root + 'images/header/navbar/parentsfamilies_off.gif';*/

//academics
var academicson = new Image();
var academicsoff = new Image();
academicson.src = root + 'images/header/navbar/academics_on.gif';
academicsoff.src = root + 'images/header/navbar/academics_off.gif';

//pastors
var pastorschurcheson = new Image();
var pastorschurchesoff = new Image();
//pastorschurcheson.src = root + 'images/header/navbar/pastorschurches_on.gif';
pastorschurchesoff.src = root + 'images/header/navbar/pastorschurches_off.gif';
pastorschurcheson.src = root + 'images/header/navbar/pastorschurches_on.gif';

//giving - Added by Aadit 11/27/2007
var onlinegivingon = new Image();
var onlinegivingoff = new Image();
//pastorschurcheson.src = root + 'images/header/navbar/pastorschurches_on.gif';
onlinegivingoff.src = root + 'images/header/navbar/pastorschurches_off.gif';
onlinegivingon.src = root + 'images/header/navbar/pastorschurches_on.gif';

//currentstudents
var currentstudentson = new Image();
var currentstudentsoff = new Image();
currentstudentson.src = root + 'images/header/navbar/current_students_on.gif';
currentstudentsoff.src = root + 'images/header/navbar/current_students_off.gif';

//visitorsfriends
var visitorsfriendson = new Image();
var visitorsfriendsoff = new Image();
//visitorsfriendson.src = root + 'images/header/navbar/visitorsfriends_on.gif';
visitorsfriendsoff.src = root + 'images/header/navbar/visitorsfriends_off.gif';
visitorsfriendson.src = root + 'images/header/navbar/visitorsfriends_off.gif';

//goto
var gotoon = new Image();
var gotooff = new Image();
gotoon.src = root + 'images/header/navbar/goto_on.gif';
gotooff.src = root + 'images/header/navbar/goto_off.gif';

function rollOver(btn) {document.images[btn].src = eval(btn + 'on.src');}
function rollOut(btn) {document.images[btn].src = eval(btn + 'off.src');}

function gotoInfo() {
	if(document.webform01.info.options[document.webform01.info.selectedIndex].value != '') {
		document.location.href = root + document.webform01.info.options[document.webform01.info.selectedIndex].value;
	}
}

function dspTop(typ) {
	var out;

	out = '<center><table cellpadding="0" cellspacing="0" border="0" width="774">\n' +
			'<tr><td class="matte" width="774" colspan="3"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="11" alt="" /></td></tr>\n' +
			'<tr>\n' +
				'<td class="matte" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="1" alt="" /></td>\n' +
				'<td class="header" width="752">\n' +
					'<table cellpadding="0" cellspacing="0" border="0">\n' +
						'<tr>\n' +
							'<td width="106" rowspan="2"><a href="' + root + 'index.htm"><img src="' + root + 'images/header/emblem.gif" border="0" width="106" height="104" alt="Eastern Nazarene College" /></a></td>\n' +
							'<td width="279"><a href="' + root + 'index.htm"><img src="' + root + 'images/header/tagline.gif" border="0" width="279" height="73" alt="Eastern Nazarene College: Many Differences, One Faith" /></a></td>\n' +
							'<td width="356" align="right">\n' +
								'<form name="webform01" method="post" action="#">\n' +
								'<span class="topnav">';
								/* Removed the Home Link and Added About Us
								if(typ != 'home') {out = out + '<a class="tnavoff" href="' + root + 'index.htm">Home</a>&nbsp;|&nbsp;';}*/
								/* link to library */
								out = out + '<a class="tnavoff" href="http://library.enc.edu">Library</a>&nbsp;|&nbsp;';
								//if(typ == 'athl') {out = out + '<a class="tnavon" href="' + root + 'athletics.htm">Athletics</a>&nbsp;|&nbsp;';}
								if(typ == 'athl') {out = out + '<a class="tnavon" href="http://www.enc.edu/athletics/">Athletics</a>&nbsp;|&nbsp;';}
								//else {out = out + '<a class="tnavoff" href="' + root + 'athletics.htm">Athletics</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="tnavoff" href="http://www.enc.edu/athletics/">Athletics</a>&nbsp;|&nbsp;';}
								if(typ == 'news') {out = out + '<a class="tnavon" href="' + root + '../news/index.htm">News</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="tnavoff" href="' + root + '../news/index.htm">News</a>&nbsp;|&nbsp;';}
								if(typ == 'cldr') {out = out + '<a class="tnavon" href="' + root + 'calendar.htm">Calendar</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="tnavoff" href="' + root + 'calendar.htm">Calendar</a>&nbsp;|&nbsp;';}
								if(typ == 'athl') {out = out + '<a class="tnavon" href="' + root + 'info_about/about_enc/">About Us</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="tnavoff" href="' + root + 'info_about/about_enc/">About Us</a>&nbsp;|&nbsp;';}
								
								if(typ == 'cont') {out = out + '<a class="tnavon" href="' + root + 'contact_us.php">Contact Us</a>';}
								else {out = out + '<a class="tnavoff" href="' + root + 'contact_us.php">Contact Us</a>';}
								
								out = out + '<br /><br /></span>\n' +
								'<select name="info" onChange="javascript:gotoInfo();">\n' +
									'<option value="">Quick Links</option>\n' +
									'<option value="">---------------------</option>\n';
									
									
								out = out + '<option value="academics/academic_calender.htm">Academic Calendar</option>';
								out = out + '<option value="goto/directory.htm">Browse Departments and Offices</option>';	
								out = out + '<option value="org/brickleycenter/index.html">Career Services</option>';
								out = out + '<option value="goto/college_store/index.htm">College Store</option>';
								out = out + '<option value="kinderhaus/">Campus KinderHaus</option>';
								out = out + '<option value="goto/conference_services.htm">Conference Services</option>';
								out = out + '<option value="goto/counseling/academic_services.htm">Center for Academic Services</option>';
								out = out + '<option value="alumni/christian_scholar.php">Christian Scholar</option>';
								out = out + '<option value="info_about/about_enc/directions.htm">Directions</option>';
								out = out + '<option value="goto/human_resources/jobs.htm">Employment Opportunities</option>';
								out = out + '<option value="academics/registrar/index.htm">Registrar\'s Office</option>';
								out = out + '<option value="goto/studentnet/spiritual_development.htm">Spiritual Development</option>';
								out = out + '<option value="academics/registrar/shuttle_schedule.htm">Shuttle Schedule</option>';
								out = out + '<option value="goto/studentnet/">Student Life</option>';
								out = out + '<option value="goto/studentnet/office_accounts.htm">Student Accounts</option>';
								out = out + '</select>\n' +
								'</form>\n' +
							'</td>\n' +
							'<td width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="1" alt="" /></td>\n' +
						'</tr>\n' +
						'<tr><td width="646" colspan="3">';
						
						if(typ == 'pros') {out = out + '<a href="' + root + 'undergrad/"><img src="' + root + 'images/header/navbar/undergrad_admissions_on.gif" border="0" width="155" height="31" alt="Undergraduate Admissions" name="prospstudents" /></a>';}
						else {out = out + '<a href="' + root + 'undergrad/" onMouseOver="rollOver(\'prospstudents\');" onMouseOut="rollOut(\'prospstudents\');"><img src="' + root + 'images/header/navbar/undergrad_admissions_off.gif" border="0" width="155" height="31" alt="Undergraduate Admissions" name="prospstudents" /></a>';}
						if(typ == 'adlt') {out = out + '<a href="' + root + 'adult_studies/"><img src="' + root + 'images/header/navbar/adult_grad_studies_on.gif" border="0" width="159" height="31" alt="Adult & Graduate Studies" name="adult_grad_studies" /></a>';}
						else {out = out + '<a href="' + root + 'adult_studies/" onMouseOver="rollOver(\'adult_grad_studies\');" onMouseOut="rollOut(\'adult_grad_studies\');"><img src="' + root + 'images/header/navbar/adult_grad_studies_off.gif" border="0" width="159" height="31" alt="Adult & Grad Studies" name="adult_grad_studies" /></a>';}
						/*Added Current Student Roll Over - Aadit 2/5/2008*/
						if(typ == 'curr') {out = out + '<a href="' + root + 'goto/studentnet"><img src="' + root + 'images/header/navbar/current_students_on.gif" border="0" width="104" height="31" alt="Go To" name="currentstudents" /></a>';}
						else {out = out + '<a href="' + root + 'goto/studentnet/" onMouseOver="rollOver(\'currentstudents\');" onMouseOut="rollOut(\'currentstudents\');"><img src="' + root + 'images/header/navbar/current_students_off.gif" border="0" width="104" height="31" alt="Go To" name="currentstudents" /></a>';}
						if(typ == 'alum') {out = out + '<a href="' + root + 'alumni/"><img src="' + root + 'images/header/navbar/alumni_on.gif" border="0" width="61" height="31" alt="Alumni" name="alumni" /></a>';}
						else {out = out + '<a href="' + root + 'alumni/" onMouseOver="rollOver(\'alumni\');" onMouseOut="rollOut(\'alumni\');"><img src="' + root + 'images/header/navbar/alumni_off.gif" border="0" width="61" height="31" alt="Alumni" name="alumni" /></a>';}
						if(typ == 'acdm') {out = out + '<a href="' + root + 'academics/index.htm"><img src="' + root + 'images/header/navbar/academics_on.gif" border="0" width="74" height="31" alt="Academics" name="academics" /></a>';}
						else {out = out + '<a href="' + root + 'academics/index.htm" onMouseOver="rollOver(\'academics\');" onMouseOut="rollOut(\'academics\');"><img src="' + root + 'images/header/navbar/academics_off.gif" border="0" width="74" height="31" alt="Academics" name="academics" /></a>';}
						/*if(typ == 'pfam') {out = out + '<a href="' + root + 'index.htm"><img src="' + root + 'images/header/navbar/parentsfamilies_on.gif" border="0" width="111" height="31" alt="Parents &amp; Families" name="parentsfamilies" /></a>';}
						else {out = out + '<a href="' + root + 'index.htm" onMouseOver="rollOver(\'parentsfamilies\');" onMouseOut="rollOut(\'parentsfamilies\');"><img src="' + root + 'images/header/navbar/parentsfamilies_off.gif" border="0" width="111" height="31" alt="Parents &amp; Families" name="parentsfamilies" /></a>';}*/
						
						/*Activated the Roll Over image for Giving to ENC 11/27/07 - Aadit S*/
						if(typ == 'pchr') {out = out + '<a href="' + root + 'giving/index.php"><img src="' + root + 'images/header/navbar/pastorschurches_on.gif" border="0" width="93" height="31" alt="Giving to ENC" name="onlinegiving" /></a>';}
						else {out = out + '<a href="' + root + 'giving/index.php" onMouseOver="rollOver(\'onlinegiving\');" onMouseOut="rollOut(\'onlinegiving\');"><img src="' + root + 'images/header/navbar/pastorschurches_off.gif" border="0" width="93" height="31" alt="Giving to ENC" name="onlinegiving" /></a>';}
						/* GoTo Button wiped out from the Web Committee meeting 2/-/7/08	
						if(typ == 'goto') {out = out + '<a href="' + root + 'goto/"><img src="' + root + 'images/header/navbar/goto_off.gif" border="0" width="54" height="31" alt="Go To" name="goto" /></a>';}
						else {out = out + '<a href="' + root + 'goto/" onMouseOver="rollOver(\'goto\');" onMouseOut="rollOut(\'goto\');"><img src="' + root + 'images/header/navbar/goto_off.gif" border="0" width="54" height="31" alt="Go To" name="goto" /></a>';}*/
						/*if(typ == 'vsit') {out = out + '<a href="' + root + 'index.htm"><img src="' + root + 'images/header/navbar/visitorsfriends_on.gif" border="0" width="58" height="31" alt="Visitors &amp; Friends" name="visitorsfriends" /></a>';}
						else {out = out + '<a href="' + root + 'index.htm" onMouseOver="rollOver(\'visitorsfriends\');" onMouseOut="rollOut(\'visitorsfriends\');"><img src="' + root + 'images/header/navbar/visitorsfriends_off.gif" border="0" width="58" height="31" alt="Visitors &amp; Friends" name="visitorsfriends" /></a>';}*/
						
						out = out + '</td></tr>\n' +
					'</table>\n' +
				'</td>\n' +
				'<td class="matte" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="1" alt="" /></td>\n' +
			'</tr>\n' +
			'<tr>\n' +
				'<td class="matte" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="545" alt="" /></td>\n';
			
	document.write(out);
}

function dspBot(typ) {
	var out;

	out = '<td class="matte" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="1" alt="" /></td>\n' +
			'</tr>\n' +
			'<tr>\n' +
				'<td class="matte" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="1" alt="" /></td>\n' +
				'<td class="footer" width="752">\n' +
					'<table cellpadding="0" cellspacing="0" border="0">\n';
						
						if(typ == 'home') {out = out + '<tr><td class="homeshadow" width="752" colspan="4"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="9" alt="" /></td></tr>\n';}
						else {out = out + '<tr><td class="intshadow" width="752" colspan="4"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="9" alt="" /></td></tr>\n';}
						
						out = out + '<tr><td width="752" colspan="4"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="11" alt="" /></td></tr>\n' +
						'<tr>\n' +
							'<td width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="41" alt="" /></td>\n' +
							'<td width="365">\n' +
							'<FORM method=GET action=http://www.google.com/custom><TABLE cellspacing=0 border=0><tr valign=top><td><A HREF=http://www.google.com/search><IMG SRC=/images/footer/Logo_40wht.gif border=0 ALT=Google align=middle></A></td><td><INPUT TYPE=text name=q size=31 maxlength=255 value=""><INPUT type=submit name=sa VALUE="Google Search"><INPUT type=hidden name=cof VALUE="AH:center;LH:111;L:http://www.enc.edu/images/interior/EasternNazareneCollegeLogo.jpg;LW:111;AWFID:46d8dd38e5e10bbc;"><input type=hidden name=domains value="enc.edu"><br><input type=radio name=sitesearch value=""> Search WWW <input type=radio name=sitesearch value="enc.edu" checked> Search enc.edu</td></tr></TABLE></FORM>\n' + 
/*								'<form name="webform02" method="post" action="#">\n' +
								'<img src="' + root + 'images/footer/search_site.gif" border="0" width="60" height="18" alt="Search Site" /><br />\n' +
								'<table cellpadding="0" cellspacing="0" border="0"><tr><td><input name="search" size="20" />&nbsp;</td><td><img src="' + root + 'images/footer/go.gif" border="0" width="27" height="21" alt="Go" /></td></tr></table>\n' +
								'</form>\n' +*/
							'</td>\n' +
							'<td width="365" align="right">\n' +
								'<span class="contact">\n' +
								'Eastern Nazarene College<br />\n' +
								'23 East Elm Avenue, Quincy, Massachusetts 02170<br />\n' +
								'1-617-745-3000 <span class="ctacpip">|</span> 1-800-88-ENC-88\n' +
								'</span>\n' +
							'</td>\n' +
							'<td width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="1" alt="" /></td>\n' +
						'<tr>\n' +
						'<tr><td width="752" colspan="4"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="11" alt="" /></td></tr>\n' +
						'<tr><td class="botbar" width="752" colspan="4"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="5" alt="" /></td></tr>\n' +
						'<tr>\n' +
							'<td class="botbar" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="11" alt="" /></td>\n' +
							'<td class="botbar" width="465">\n' +
								'<span class="botnav">\n'
								
								if(typ == 'disc') {out = out + '<a class="bnavon" href="' + root + 'disclaimer.htm">Disclaimer</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="bnavoff" href="' + root + 'disclaimer.htm">Disclaimer</a>&nbsp;|&nbsp;';}
								if(typ == 'webm') {out = out + '<a class="bnavon" href="' + root + 'webmaster.htm">Contact Webmaster</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="bnavoff" href="' + root + 'webmaster.htm">Contact Webmaster</a>&nbsp;|&nbsp;';}
								if(typ == 'webm') {out = out + '<a class="bnavon" href="' + root + 'rss/rss.xml">Subscribe to RSS</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="bnavoff" href="' + root + 'alerts/index.php">ENC Alerts</a>&nbsp;|&nbsp;';}
								if(typ == 'webm') {out = out + '<a class="bnavon" href="' + root + 'alerts/index.php">ENC Alerts</a>&nbsp;|&nbsp;';}
								else {out = out + '<a class="bnavoff" href="' + root + 'rss/rss.xml">Subscribe to RSS</a>&nbsp;|&nbsp;';}
								if(typ == 'smap') {out = out + '<a class="bnavon" href="' + root + 'site_map.htm">Site Map</a>';}
								else {out = out + '<a class="bnavoff" href="' + root + 'site_map.htm">Site Map</a>';}	
								
								out = out + '</span>\n' +
							'</td>\n' +
							'<td class="botbar" width="365" align="right">\n' +
								'<span class="copyright">\n' +
								'&copy; 2008 Eastern Nazarene College.\n' +
								'</span>\n' +
							'</td>\n' +
							'<td class="botbar" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="11" height="1" alt="" /></td>\n' +
						'</tr>\n' +
						'<tr><td class="botbar" width="752" colspan="4"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="5" alt="" /></td></tr>\n' +
					'</table>\n' +
				'</td>\n' +
				'<td class="matte" width="11"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="1" alt="" /></td>\n' +
			'</tr>\n' +
			'<tr><td class="matte" width="774" colspan="3"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="11" alt="" /></td></tr>\n' +
			'</table></center>';
			
	document.write(out);
}

function dspQLnks() {
	var out;

	out = '<tr align="left"><td class="dotsrule" width="173"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="1" alt="" /></td></tr>\n' +
			'<tr><td width="173"><img src="' + root + 'images/interior/lnav_qlinks.gif" border="0" width="173" height="33" alt="" /></td></tr>\n' +
			'<tr align="left"><td>\n' +
			'<div class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow02.gif" border="0" width="10" height="10" alt="" align="top" /><a href="' + root + 'goto/studentnet/office_accounts.htm">Office of Student<br />Accounts</a></div>\n' +
			'<div class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow02.gif" border="0" width="10" height="10" alt="" align="top" /><a href="' + root + 'goto/studentnet/office_development.htm">Office of Student<br />Development</a></div>\n' +
			'<div class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow02.gif" border="0" width="10" height="10" alt="" align="top" /><a href="' + 'http://www.e-fao.com/enc/student">Office of Financial<br />Aid</a></div>\n' +
			'<div class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow02.gif" border="0" width="10" height="10" alt="" align="top" /><a href="' + root + 'academics/registrar/index.htm">Registrars Office<br /></a></div>\n' +
			'<div class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow02.gif" border="0" width="10" height="10" alt="" align="top" /><a href="' + root + 'campus_map.htm">Campus Map</a></div>\n' +
			'<div class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow02.gif" border="0" width="10" height="10" alt="" align="top" /><a href="' + root + 'contact_us.php">Contact Us</a></div>\n' +
			'<div><img src="' + root + 'images/spacer.gif" border="0" width="1" height="13" alt="" /></div>\n' +
			'</td></tr>';
							
	document.write(out);
}

/* Quick Links for Alumni Relations*/

function dspQuick_Links_Alumni() {
	var out;

	out = '<tr><td class="dotsrule" width="173"><img src="' + root + 'images/spacer.gif" border="0" width="1" height="1" alt="" /></td></tr>\n' +
			'<tr><td width="173"><img src="' + root + 'images/interior/lnav_qlinks.gif" border="0" width="173" height="33" alt="" /></td></tr>\n' +
			'<tr><td>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + 'http://www.enc.edu/org/brickleycenter/index.html">Careeer Services<br /></a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + root + 'goto/directory.htm">Faculty/Staff Directory<br /></a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + root + 'info_about/about_enc/history.htm">History</a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + root + 'academics/registrar/transcript.htm">Request Transcript<br /></a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + root + 'academics/registrar/index.php">Registrars Office<br /></a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + root + 'info_about/about_enc/photo_tour.php">Photo Tour</a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="' + root + 'news/index.htm">News</a></div>\n' +
			'<div align="left" class="lnavlink03off divhover"><img src="' + root + 'images/list_arrow01.gif" border="0" width="12" height="10" alt="" align="top" /><a href="mailto:prayerrequest@enc.edu">Submit a Prayer Request</a></div>\n' +
			'<div><img src="' + root + 'images/spacer.gif" border="0" width="1" height="13" alt="" /></div>\n' +
			'</td></tr>';
							
	document.write(out);
}
