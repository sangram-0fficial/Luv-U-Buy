<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<HR>
	<BR>
	<BR>
	    <form id="modify" action="Bookmodification" method="post">
		<a href="Logout.jsp" ><font size="4"  >Click here to Logout</font></a>
	<%
		Connection con = null;
		
		PreparedStatement stat = null;

		ResultSet rs = null;
		String query=null;
		int book_sel = Integer.parseInt(request.getParameter("R1"));

		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997"); 



		query="Select a.*,b.CategoryName from book_details a, categorydetails b where a.BookId=? and a.CategoryId=b.CategoryId";
	
		stat = con.prepareStatement(query);
		stat.setInt(1,book_sel);

		rs=stat.executeQuery();
		if(rs.next())
		{
	%>
		<br><h3>Details of Selected Book:</h3>
		
		<input type="hidden" name="CategoryId" value="<%=rs.getString(2)%>">
		<table border=1>
		<tr>
		<td>Book Id</td><td><input type="hidden" name="BookId" value="<%=book_sel%>"><%=book_sel%> </td></tr>
		<tr>
		<td>Book Name</td><td><input type="text" name="Title" value=<%=rs.getString(3)%>></td>
		</tr><tr>
		<td>Author Name</td><td><input type="text" name="Author" value=<%=rs.getString(4)%>></td>
		</tr><tr>
		<td>Publisher</td><td><input type="text" name="Publisher" value=<%=rs.getString(5)%>></td>
		</tr><tr>
		<td>Edition</td><td><input type="text" name="Edition" value=<%=rs.getString(6)%>></td>
		</tr><tr>
		<td>Price (in Rupees)</td><td><input type="text" name="Price" value=<%=rs.getString(7)%>></td>
		</tr><tr>
		<td>Quantity Available(Numbers)</td><td><input type="text" name="Quantity" value=<%=rs.getString(8)%>></td>
		</tr><tr>
		<td>Description</td><td><input type="text" name="Description" value=<%=rs.getString(9)%>></td>
		</tr><tr>
		<td>Category</td><td><input type="text" name="CategoryName" value=<%=rs.getString(10)%>></td>
		</tr><tr>
		<tr><td><input type="submit" value=" Save Changes "></td><td><input type="Reset" value="    Clear    "></td></tr>
		</table>
		</form>
		<%
		}
	}
		catch(Exception e)
		{
			out.print("Error = " + e + "<HR>");
	}
	%>
</body>
</html>