<%@ page import="java.util.Date" %>
<%
	Date myDate = new Date();
	String personID = ""+session.getAttribute("PersonID");
	String amount = ""+session.getAttribute("DueAtReg");
	amount = amount.replaceAll(",","");
	personID = ""+(Long.parseLong(personID)*((myDate.getYear()+1900)*(myDate.getMonth()+1)*myDate.getDate()));
%>
	<div><img src="https://sam.swau.edu/Tools/OnlinePayment/image001.gif" /></div>
	<iframe 
		src="https://sam.swau.edu/Tools/OnlinePayment/CheckoutPage.jsp?personID=<%= personID %>&amount=<%= amount %>"
		width="714"
		height="750"
		frameborder="0" >
	</iframe>