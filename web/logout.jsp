<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%-- wStudntDHomePage --%>

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
<%

ObjectEngine objectEngine = JavaObjectEngine.getInstance();

session = request.getSession( );
Task task = null;
String taskId = (String) session.getAttribute( "ZeidonTaskId" );
if ( !StringUtils.isBlank( taskId ) )
{
   task = objectEngine.getTaskById( taskId );
   if ( task != null )
   {
        task.log().info( "On logout window UnregisterZeidonApplication: -------->>> "  );

         task.dropTask();
         task = null;
   }
         session.setAttribute( "ZeidonTaskId", null );
}

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ePamms - Successful LogOut</title>

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
   color:#265e15;
   font-family: Verdana, Helvetica, sans-serif;
   font-size:13px;
   text-align:center;
   //background-color:#F5F5F5;
    //margin: 0px 0px 0px 0px;
    //padding: 0px;
    //text-align:left; /* horizontal centering for IE Win quirks, tried "align:center, works in FF but not IE */
    //font-family:Verdana, Arial, Helvetica, sans-serif;
    //font-size: 11px;
    //line-height: normal;
    //font-weight: normal;
    //font-variant: normal;
    //text-transform: none;
    //background-position: 0px 0px;
    //background-color:#4c6a49;
    //background-color:darkgray;
    //background-color:#1A6886;
    background-color:#52839e;

}
/************* Header **************/
#header {
   width: 970px;
   height: 100px;
   //background-image: url(../images/student_banner.gif);
   //background-image: url(../images/newlogo1.gif);
   //background-image: url(../images/newlogo.gif);
   //background-image: url(../images/newlogo3.gif);
   background-image: url(images/cityscape.gif);
   //background-color:#1A6886;
   background-color:#FFFFFF;
   margin-top: 0px;
   margin-right: auto;
   margin-bottom: 0px;
   margin-left: auto;
   //padding-top: 5px;
   padding-right: 15px;
   padding-left: 15px;
   //padding-bottom: 5px;
   background-repeat: no-repeat;
   border-bottom-width: 1px;
   border-top-style: none;
   border-right-style: none;
   border-bottom-style: solid;
   border-left-style: none;
   border-bottom-color: #E2DDDD;
}

#header a {
   text-decoration: none;
   color: #FFFFFF;
}

#maincontent{
   padding:0;
   width:1000px;
   display:block;
   float:left;
    background-color:white;
    border-left:px solid #E2DDDD;
    border-right:1px solid #E2DDDD;
   height:400px;
}

</style>
</head>

<body>
   <div id="wrapper">
<div id="header">
</div>
<div id="maincontent">
           <p align="center">&nbsp;</p>
           <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
           <p align="center">Logout from ePamms.</p>
           <p align="center"><a href="wStartUpUserLogin.jsp" style="text-decoration:underline">Click here to log back in to ePamms</a></p>
           <p align="center"><a href="wStartUpUserLogin.jsp" style="text-decoration:underline">Secure Log In</font><font size="2"> <img src="images/secure_login.gif" alt="Secure Login" width="16" height="17" /><br />
                            </a>
    </div>
</div>

</body>
</html>
