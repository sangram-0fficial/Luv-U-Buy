<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>   
<%  
String Bname=request.getParameter("val");  
if(Bname==null||Bname.trim().equals("")){  
out.print("<p>Please enter Book name!</p>");  
}else{  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997");  
PreparedStatement ps=con.prepareStatement("select * from book_details where Title like '"+Bname+"%'");  
ResultSet rs=ps.executeQuery();  
  
if(!rs.isBeforeFirst()) {      
 out.println("<p>No Record Found!</p>");   
}else{   
out.print("<table border='1' cellpadding='2' width='100%'>");  
out.print("<tr>Title<th></th><th>Author</th><th>Publisher</th><th>Edition</th><th>Price</th><th>Quantity</th><th>Description</th></tr>");     
while(rs.next()){  
out.print("<tr><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>" 
+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td></tr>");  
}  
out.print("</table>");  
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>  