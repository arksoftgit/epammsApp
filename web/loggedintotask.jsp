<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%-- wStudntDHomePage --%>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.lang3.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HFI Cheetah - Successful LogOut</title>


<style>
#wrapper{
	margin-left:auto;
	margin-right:auto;
	width:1000px;
	height:auto;
	display:block;
	position:relative;
	text-align:center
}

/************* Defines the body **************/
body{
	text-align:center;
	font-family: Verdana, Helvetica, sans-serif;
	font-size:11px;
	background-color:#EFEFF1;
}

/************* Header **************/
#header {
	-moz-border-radius-topleft:5px;
	-webkit-border-top-left-radius:5px;
 	-moz-border-radius-topright:5px;
	-webkit-border-top-right-radius:5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius:5px;
	border-bottom-left-radius: 5px;
	width: 1000px;
	height: 72px;
	background-image: url(./images/logo.gif);
	background-color:#2A348D;  /* darker purple 42.52.141 */
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	background-repeat: no-repeat;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-bottom-color: #2A348D; /* #5660A5; */
}

#header a {
	text-decoration: none;
	color: #FFFFFF;
}

#maincontent{
	display:block;
	float:left;
	height:100%;
	margin: 0px;
	padding:0;
	width:998px;
   	background-color: #E2DDDD; /* grey ish 226,221,221 */
   	border-left: 1px solid #E2DDDD;
   	border-right:1px solid #E2DDDD;
 	-moz-border-radius-topright:5px;
	-webkit-border-top-right-radius:5px;
	border-top-right-radius: 5px;
}

</style>

</head>

<body>
<div id="wrapper">
<div id="header">
   <div id="logo">
      <!--Page Title -->
      <!-- Before Logo-->
   </div>
</div>
<div id="maincontent">
			  <p align="center">&nbsp;</p>
			  <p align="center">You already have a Cheetah session open. You can not have more than one.</p>
    </div>
</div>

</body>

</html>
