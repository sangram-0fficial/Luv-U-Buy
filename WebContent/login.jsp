<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Love u buy </title>
</head>
<body>
<form id="Validate" action="Validate" method="get">
<p align="center"><font size="5"><b>Login Form</b></font></p>
<table align="center" height="60">
<tr>
	<td>
	<b>Username:</b>
	</td>
	<td>
	<input type="text" name="username" size="21" tabindex="1">
	</td>
</tr>
<tr>
	<td>
	<b>Password:</b>
	</td>
	<td>
	<input type="password" name="pass" size="21" tabindex="2">
	</td>
<tr align="center">
	<td colspan="2">
	<input type="submit" value=" Login  " name="B1"  tabindex="3">
	</td>
</tr>
<tr>
	<td><font size="4">New user?</font></td>
	<td><a href="NewUser.jsp"><font size="4">Register</font></a></td>
</tr>
	
</table>
</form>
</body>
</html>