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
<BR>
	<HR>
	<BR>
	<BR>
	<form id="modify" action="modifybook.jsp">
	<a href="Logout.jsp" ><font size="4"  >Click here to Logout</font></a>
	
	<%
		Connection con = null;
		
		PreparedStatement stat = null;
			
		ResultSet rs = null;
		String query=null;
		int ctr=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997");

		query="Select a.*,b.CategoryName from book_details a, categorydetails b where a.CategoryId=b.CategoryId";
		stat = con.prepareStatement(query);
		
		rs=stat.executeQuery();
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
			out.println("<input type=radio name=R1 value="+int_BOOKID+">");
					
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
	%>
		<tr>
			<td><input type="submit" value="   Modify    "></td>
			<td><input type="Reset" value="   Clear    "></td>
		</tr>
		</table>
		</form>
	<%
		}
		catch(Exception e)
		{
		out.print("Error = " + e + "<HR>");
	}
	%>
</body>
</html>