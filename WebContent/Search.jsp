<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="bean.UserBean5" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Love u Buy</title>
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
backrround-color: alpha(opacity=50);
border-radius:15px;
margin: 0 auto;
margin-top: 40px;
padding-top: 10px;

}

</style>
</head>
<%
List<UserBean5> productList = (List<UserBean5>)request.getAttribute("productList");
%>
<body>
<a href="Cart.jsp" ><font size="5"  color="#00FF00" >My Cart!</font></a>
 <form name="Add" action="Addtotemp" method="POST">
	<CENTER>
<H1> <u><font color="white"> Luv u Buy </font></u> </H1>
<font size="5" color="white">Search Results</font>

<BR>

			<input type="text" value="  Pick-> what-> u <-> love!" style="margin-top:3%" disabled>
			<table border="2">
			<tr>
			
			<td><font size="2" color="#00FF00">Sno.</font></td>
			<td><font size="2" color="#00FF00">Select</font></td>
			<td><font size="2" color="#00FF00">Book Name</font></td>
			<td><font size="2" color="#00FF00">Author Name</font></td>
			<td><font size="2" color="#00FF00">Publisher</font></td>
			<td><font size="2" color="#00FF00">Edition</font></td>
			<td><font size="2" color="#00FF00">Price (in Rupees)</font></td>
			<td><font size="2" color="#00FF00">Quantity</font></td>
			<td><font size="2" color="#00FF00">Description</font></td>
			</tr>
			<%
			int i=0;
			for(UserBean5 product : productList){
				%>
				<tr>
				<td><font color="white"><%=i=i+1 %></font></td>
				<td><font color="white"><input type="radio" name="BookId" value="<%=product.getInt_BOOKID()%>"></input></font></td>
				<td><font color="white"><%=product.getStr_TITLE() %></font></td>
				<td><font color="white"><%=product.getStr_AUTHOR() %></font></td>
				<td><font color="white"><%=product.getStr_PUBLISHER() %></font></td>
				<td><font color="white"><%=product.getStr_EDITION() %></font></td>
				<td><font color="white"><%=product.getInt_PRICE() %></font></td>
				<td><font color="white">Available</font></td>
				<td><font color="white"><%=product.getStr_DESCRIPTION() %></font></td>
			</tr>
				<%
			}
			%>
		</table>	
		<input type="submit" value=" Add to Cart" name="Add" style="margin-top:3%">
	</CENTER>	
	
<a href="Logout.jsp" ><font size="4" color="#00FF00" >Click here to Logout!</font></a>
</form>
</body>
</html>