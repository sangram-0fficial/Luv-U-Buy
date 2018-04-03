<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form name="addcategory" action="Add_Category" method="post">
	<a href="Logout.jsp" ><font size="4"  >Click here to Logout!</font></a>
	<%
	Connection con = null;
	
	
	String query=null;
	int ctr=0, flag=0;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997"); 
	
	
	PreparedStatement ps=con.prepareStatement("select * from categorydetails");
	ps.executeQuery();
	ResultSet rs=ps.executeQuery();
	%>
	<br><h3>Add New Category:</h3>
	<table border=1>
	<tr>
	<td>Categories Available</td>
		<td><select size="1" name="CategoryName">
		<%
		while(rs.next())
		{%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
			<%}%>
			</select></td>
	</tr>
	<tr>
	<td>Category to be added</td>
	<td><input type="text" name="CategoryId"></td></tr>
	<tr>
	
	<tr><td><input type="submit" value="   Add    "></td><td><input type="Reset" value="   Clear    "></td>
	</table></form>
<%
	}
	catch(Exception e)
	{
	out.print("Error = " + e + "<HR>");
	}
%>
</body>
</html>