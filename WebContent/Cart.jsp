<%@page import="dao.UserDao2"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
     <%@ page import="bean.UserBean5" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Luv u Buy</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<style type="text/css">
body {
	background-image:url('resources/images/shadows.jpg');
	background-position: center;
    background-repeat: no-repeat;
    }
.text-center{
width:300px;
hight:200px;
backrround-color: rgba(0,0,0,0.5);
border-radius:15px;
margin: 0 auto;
margin-top: 40px;
padding-top: 10px;

}

</style>
</head>
<%
String username=(String)session.getAttribute("username");
List<UserBean5> clist=new UserDao2().fetchCartByUserId(username);
%>
<body>
<a href="Hey_Buddy.jsp" ><font size="4" color="#00FF00">Love to search more!</font></a>
<CENTER>
	<h3><font color="white">Your Cart Details are as follows:</font></h3>
		
		<form name="shop" action="Cartquantity" method="post">
		
		<table border=1>
		<tr>
		<td><font size="2" color="#00FF00">S.No</font></td>
		<td><font size="2" color="#00FF00">Book Name</font></td>
		<td><font size="2" color="#00FF00">Price (in Rupees)</font></td>
		<td><font size="2" color="#00FF00" colspan="2">Select to Delete</font></td>
		</tr>	
		<%
	int i=0;
	float sum=0;
	for(UserBean5 Cartlist : clist)
	{
		sum=sum+Cartlist.getInt_PRICE();
		%>
		<tr>
		
		<td><font color="white"><%=i=i+1 %></font></td>
		<td><font color="white"><%=Cartlist.getStr_TITLE() %></font></td>
		<td><font color="white"><%=Cartlist.getInt_PRICE() %></font></td>
		<td><font color="white"><a href="Cartdelete?BookId=<%=Cartlist.getInt_BOOKID() %>" value="<%=Cartlist.getInt_BOOKID() %>" name="BookId"><font color="#FF4500">delete</font></a></font></td>
		</tr>
		<%  
	}
	%>
	<tr>
	<td colspan="5"><font color="white">Total Amount :&nbsp;&nbsp;&nbsp;<%=sum%></font></td>
	</tr>
	</table>
	<br>
		<input type=submit value="Place Order">
	<br>
	</form>
</CENTER>
<a href="Logout.jsp" ><font size="4" color="#00FF00">Click here to Logout!</font></a>
</body>
</html>