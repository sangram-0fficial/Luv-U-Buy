  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<h2>Welcome Admin</h2>
<body>
<Form name="admin" method="POST">
	<TABLE width=100% border="0" cellpadding="2" cellspacing="0">
	<TR> 
   		<th align = "left" width="4%"></th> 
   		<th align = "left" width="20%"></th> 
   		<th align = "left" width="38%"></th> 
   		<th align = "left" width="38%"></th> 
   	</TR>
	<TR>
   		<TH>1</TH>	
   		<TH align = "left">Book</TH>
   		<TH><a href="insert.jsp">Insert New Book Details</a></TH>
   		<TH><a href="modify.jsp">Modify Book Details</a></TH>
	</TR>
	<TR> 
   		<TH>2</TH>	
   		<TH align = "left">Category</TH>
   		<TH><a href="insert_category.jsp">Insert Book Category</a></TH>
   		<TH><a href="update_category.jsp">Modify Book Category</a></TH>
	</TR>
	</TABLE>
	<a href="Logout.jsp" ><font size="4"  >Click here to Logout</font></a>
	</Form>
</body>
</html>