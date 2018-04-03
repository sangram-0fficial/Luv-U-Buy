<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<style type="text/css">
body {
	background-image:url('resources/images/ancient-wallpaper-14.jpg');
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
<title>Luv u Buy</title>
</head>
<body>
<a href="Cart.jsp" ><font size="5"  color="#00FF00" >My Cart!</font></a>

<SCRIPT language="JavaScript">

  	function startSearch()
  	{
  		
  		if(document.frm.R1[1].checked)
  		{
  			if(document.frm.BookTitle.value=="")
			{
				alert("You must enter a book title");
				return;
			}
  		}
    		
  		if(document.frm.R1[2].checked)
  		{
	  		if(document.frm.BookAuthor.value=="")
			{
				alert("You must enter an author name");
			return;
			}
  		}	
  	
  		if(document.frm.R1[3].checked)
  		{
  			if(document.frm.BookPublisher.value=="")
			{
			alert("You must enter a publisher name");
			return;
			}
  		}
  	
  		document.frm.submit();
  		} 
	 	
  	</SCRIPT>
  
  <form name ="frm" action="Searchresult" method="get">
	<%
	Connection con = null;

	PreparedStatement stat = null;
	ResultSet rs = null;
	int ctr=0, flag=0;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997"); 

		stat = con.prepareStatement("select * from categorydetails");

                rs=stat.executeQuery();
	%>


	
	<center>
	<font size="7"><font color="white">Search Books</font></font>
    	<BR><BR>
  

  	<table border="0" width="70%" height="196">
    	<tr>
      		<td width="17%" align="right" height="25"><input type="radio" value="CategoryId" checked name="R1"></td>
      		<td width="32%" height="25"><font color="white">Search by Category</font></td>
      		<td width="51%" height="25">
      			<select size="1" name="BookCategory">
      			<option selected value="Select">Select Category</option>
				<%
				while(rs.next())
				{
				String category=rs.getString(2);
				int CategoryId=rs.getInt(1);
				%>
	    			<option value="<%=CategoryId%>"><%=category%></option>
  				<%}%>
    			</select>
    	      	</td>
    	</tr>
    	<tr>
      		<td width="17%" align="right" height="25"><input type="radio" name="R1" value="Title"></td>
      		<td width="32%" height="25"><font color="white">Search by Book Title</font></td>
      		<td width="51%" height="25"><input type="text" name="BookTitle" size="25" style="margin-top:3%"></td>
    	</tr>
    	<tr>
    		<td width="17%" align="right" height="25"><input type="radio" name="R1" value="Author"></td>
      		<td width="32%" height="25"><font color="white">Search by Book Author</font></td>
      		<td width="51%" height="25"><input type="text" name="BookAuthor" size="25" style="margin-top:2%"></td>
    	</tr>
    	<tr>
      		<td width="17%" align="right" height="25"><input type="radio" name="R1" value="Publisher"></td>
      		<td width="32%" height="25"><font color="white">Search by Book Publisher</font></td>
      		<td width="51%" height="25"><input type="text" name="BookPublisher" size="25" style="margin-top:2%"></td>
    	</tr>
    	<tr>      
   	</tr>
    	<tr>
      		<td width="17%" align="right" height="21"></td>
      		<td width="32%" height="21">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="    Search    " name="Search" onClick="startSearch();"></td>
      		
    	</tr>
    	
  	</table>
  	 </center>
  	 <input type="text" name="name" onkeyup="searchInfo()" placeholder="Testing" id='mytext'>  
  	 <span id="mylocation1"></span>  
  	<a href="Logout.jsp"><font color="#00FF00" size="5">Click here to logout</font></a>

	
</form> 
   
  
<span id="mylocation"></span>  
	<%
	}
	catch(Exception e)
	{
		out.print("Error = " + e + "<HR>");
	}
	%>
</body>
<script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var Bname=document.getElementById('mytext').value;  
var url="Autosearch2.jsp?val="+Bname;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation1').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>  
</html>