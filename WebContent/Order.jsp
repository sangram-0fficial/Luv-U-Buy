<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
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
List<UserBean5> odlist=(List<UserBean5>)request.getAttribute("odlist");
%>
<body>
<a href="Cart.jsp" ><font size="5"  color="#00FF00" >My Cart!</font></a>
	<form action="Proceedorder" method="post">
	<script>
var total_amount=0;
	function getAmmount(myid)
	{
		
		var priceid=myid+"price";
		var amountid=myid+"amount";
		var price=document.getElementById(priceid).value;
		var quantity=document.getElementById(myid).value;
		var tAmount = document.getElementById(amountid).value;
		document.getElementById(amountid).value=price*quantity;
		total_amount=total_amount+(price*quantity)-tAmount;
		document.getElementById("total_amount").value=total_amount;
		document.form[0].action="Proceedorder";
	}
</script>
<CENTER>
	<h1><font color="white">Order details are as follows:</font></h1>
	<table border=1>
			<tr>
			
			<td><font size="2" color="#00FF00">Sno.</font></td>
			<td><font size="2" color="#00FF00">Book Name</font></td>
			<td><font size="2" color="#00FF00">Description</font></td>
			<td><font size="2" color="#00FF00">Price (in Rupees)</font></td>
			<td><font size="2" color="#00FF00">Quantity Available(Numbers)</font></td>
			<td><font size="2" color="#00FF00">Quantity</font></td>
			<td><font size="2" color="#00FF00">Value for your purchase</font></td>
			</tr>
			
			<%
			int i=0;
			int sum=0;		
			for(UserBean5 orderlist : odlist){
				sum=sum+orderlist.getInt_PRICE();
				%>
				<tr>
				<td><font color="white"><%=i=i+1 %></font></td>
				<td><font color="white"><input type="text" value="<%=orderlist.getStr_TITLE()%>" name="Title"></font></td> 
				<td><font color="white"><%=orderlist.getStr_DESCRIPTION() %></font></td>
				<td><font color="white"><input type="text" value="<%=orderlist.getInt_PRICE() %>" id="<%=i %>price" disabled/></font></td>
				<td><font color="white"><%=orderlist.getInt_QUANTITY() %></font></td>
				<td><font color="white"><select size=1 name="Quantity" id="<%=i %>" onchange="getAmmount(this.id)" required>
					<option value="">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select></font></td>
				<td><font color="white"><input type="text" value="0" id="<%=i %>amount" disabled/></font></td>
			</tr>
				<%
			}
			
			%>
			<tr>
			<td colspan=6><font color="white">total_amount</font></td><td><input type="number" id="total_amount" value="total_amount" name="total_amount" disabled/></td>
			</tr>
			</table>
			<input type="submit" value="Order" onclick="getAmmount(myid)"  style="margin-top:2%"> 
			</CENTER>
			</form>
			<a href="Logout.jsp" ><font size="4" color="#00FF00">Click here to Logout!</font></a>
	</body>
</html>