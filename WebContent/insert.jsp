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
	<form id="addbook" action="Addbook" method="POST" >
	<%
	Connection con = null;
	
	PreparedStatement stat = null;
	
	PreparedStatement stat1 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;

	String query=null;
	String query1=null;
	int ctr=0, flag=0;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997");

	query="Select a.*,b.CategoryName from book_details a, categorydetails b where a.CategoryId=b.CategoryId";
	query1="select * from categorydetails";
	
	stat = con.prepareStatement(query);
	stat1 = con.prepareStatement(query1);

	rs=stat.executeQuery();

	rs1=stat1.executeQuery();

	%>
	<br><h3>List of Available Books:</h3>
	<table border=1>
	<tr>
		<td>S.No</td>
		<td>Book Id</td>
		<td>Book Name</td>
		<td>Author Name</td>
		<td>Publisher</td>
		<td>Edition</td>
		<td>Price (in Rupees)</td>
		<td>Quantity Available(Numbers)</td>
		<td>Description</td>
		<td>Category</td>
	</tr>
	<% 
	int int_BOOKID,int_CATEGORYID,int_PRICE,int_QUANTITY;
	String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION;
	while(rs.next())
	{
		ctr=ctr+1;
		out.println("<tr><td>"+ctr);
		int_BOOKID=rs.getInt(1);
		out.println("<td>");
		out.println(int_BOOKID);
				
		int_CATEGORYID=rs.getInt(2);
					
		str_TITLE=rs.getString(3);
		out.println("<td>");
		out.println(str_TITLE);
		
		str_AUTHOR=rs.getString(4);
		out.println("<td>");
		out.println(str_AUTHOR);
			
		str_PUBLISHER=rs.getString(5);
		out.println("<td>");
		out.println(str_PUBLISHER);
		
		str_EDITION=rs.getString(6);
		out.println("<td>");
		out.println(str_EDITION);
		
		int_PRICE=rs.getInt(7);
		out.println("<td>");
		out.println(int_PRICE);
		
		int_QUANTITY=rs.getInt(8);
		out.println("<td>");
		out.println(int_QUANTITY);

		str_DESCRIPTION=rs.getString(9);
		out.println("<td>");
		out.println(str_DESCRIPTION);

		out.println("<td>");
		out.println(rs.getString(10));
			
		out.println("</tr>");
	}
	out.println("</table>");%>
	</table>
	<h3> Add New Book Details</h3>
	<table>
	<tr><td>Book Title</td>
	<td><input type="text" name="Title" required></td>
	<tr><td>Author Name</td>
	<td><input type="text" name="Author" required></td>
	<tr><td>Publisher</td>
	<td><input type="text" name="Publisher" required></td>
	<tr><td>Edition</td>
	<td><input type="text" name="Edition"required></td>
	<tr><td>Price (in Rupees)</td>
	<td><input type="number" name="Price" required></td>
	<tr><td>Quantity Available(Numbers)</td>
	<td><input type="number" name="Quantity" required></td>
	<tr><td>Description</td>
	<td><input type="text" name="Description" required></td>
	<tr><td>Category</td>
	<td><select size="1" name="CategoryName" required>
			<option value=""><-:select:-></option>
	<%
		while(rs1.next())
		{
	%>
    		<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
  		<%
  		}
  		%>
    		</select></td>
		</tr>
		<tr><td><input type="submit" value="   Add    "></td>
		<td><input type="Reset" value="    Clear    "></td>
		</table>
	<%
	}
	catch(Exception e)
	{
	out.print("Error = " + e + "<HR>");
	}
	%>
	</form>
</body>
</html>