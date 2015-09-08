<!DOCTYPE HTML>

<%-- wSystemExitHelpMessage --%>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ page import="com.quinsoft.zeidon.*" %>
<%@ page import="com.quinsoft.zeidon.standardoe.*" %>
<%@ page import="com.quinsoft.zeidon.utils.*" %>
<%@ page import="com.quinsoft.zeidon.vml.*" %>
<%@ page import="com.quinsoft.zeidon.domains.*" %>
<%@ page import="com.quinsoft.epamms.*" %>

<%! 

ObjectEngine objectEngine = com.quinsoft.epamms.ZeidonObjectEngineConfiguration.getObjectEngine();

%>

<%

session = request.getSession( );

%>

<html>
<head>
<title>ePamms Help</title>
<script language="JavaScript" type="text/javascript" src="./genjs/wSystemExitHelpMessage.js"></script>
</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">
<div id="wrapper">
<form name="wSystemExitHelpMessage" id="wSystemExitHelpMessage" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
</form>
</div>  <!-- This is the end tag for wrapper -->
</body>
</html>
<%
   session.setAttribute( "ZeidonAction", null );
%>
