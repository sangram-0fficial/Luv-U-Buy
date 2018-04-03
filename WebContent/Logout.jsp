<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<CENTER>
	<H1> <u>Love u Buy</u> </H1>
	</CENTER>
	
	<%
	session.invalidate();
	%>
        <center>
	<BR><BR><BR><BR><b>You have logged out successfully.
        <BR><BR>Return to Shopping Cart? <a href="Index1.html">Click here</a></b>
        </center>
</body>
</html>