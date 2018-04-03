<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
     <%@ page import="bean.UserBean5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Cart!</title>
</head>
<body>
	<h3>Your Cart Details are as follows:</h3>
		
		<form name="shop" action="Cartdelete" method="post">
		<%
List<UserBean5> clistd=(List<UserBean5>)request.getAttribute("clistd");
%>
		<table border=1>
		<tr>
		<td>S.No</td>
		<td>Select</td>
		<td>Book Name</td>
		<td>Price (in Rupees)</td>
		</tr>	
	<%
	int i=0;
	int sum=0;
	for(UserBean5 cdelete : clistd)
	{
		sum=sum+cdelete.getInt_PRICE();
		%>
		<tr>
		
		<td><%=i=i+1 %></td>
		<td><input type="radio" name="BookId" value="<%=cdelete.getInt_BOOKID()%>"></input></td>
		<td><%=cdelete.getStr_TITLE() %></td>
		<td><%=cdelete.getInt_PRICE() %></td>
		
		</tr>
		<%
	}
	%>
	<tr>
	<td colspan="3">Total Amount&nbsp;&nbsp;<%=sum%></td>
	</tr>
	</table>
	<br>
		<input type=submit value="Delete">
	<br>
		<a href="Deletecartitem.jsp">Click To Delete Item From Cart!</a>
	<br>
		<a href="Cart.jsp">My Cart!</a>
	</form>
</body>
</html>