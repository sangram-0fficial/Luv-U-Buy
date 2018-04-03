<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Choose payment Option!</title>
</head>
<body>
<form action="Thankyou" method="post">
<center>
	<h1><font color="white">Love the way u pay!</font></h1>
	
	
	<table>
	<tr>
	<td><input type="checkbox" name="Cash On Delivery!" required><font size="4" color="white">Cash On Delivery!</font></td>
	</tr>
	</table>
		<br>
	<input type="submit" value="order" style="margin-top:2%">
	</center>
	<a href="Logout.jsp" ><font size="4" color="#00FF00">Click here to Logout!</font></a>
	</form>
</body>
</html>