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
	<H2>Category to be Modified!</H2>
	<BR>
	<HR>
	<BR>
	<form name="modcategory" action="Modify_Category" method="post">
	<a href="Logout.jsp" ><font size="4"  >Click here to Logout</font></a>
	<BR><BR>

	<script language="Javascript">
	function changeit()
	{
		var f = document.modcategory;
		var i=f.catnm.selectedIndex;
		var str=f.catnm.options[i].text;
		document.modcategory.CategoryName.value=str;
		document.modcategory.CategoryId.value=document.modcategory.elements[0].value;
	}
	</script>

	<%
		Connection con = null;
		
		PreparedStatement stat = null;
		ResultSet rs = null;
		String query=null;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997"); 
	
		query="select * from categorydetails";
		stat = con.prepareStatement(query);
	
		rs=stat.executeQuery();
	%>
		<br><h2>Modify Category:--</h2>
		<table border=1>
		<tr>
		<td>Category</td>
		<td><select size="1" name="catnm" onChange="changeit();">
			<%
			while(rs.next())
			{%>
    			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
  			<%}%>
    			</select></td>
		</tr>
		<tr><td colspan=2><input type="text" name="CategoryName"><input type="text" name="CategoryId"></td>
		<tr><td><input type="submit" value="   Modify  "></td><td><input type="Reset" value="   Clear    "></td>
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