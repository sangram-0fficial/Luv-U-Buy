<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<style type="text/css">
body {
	background-image:url('resources/images/y1.jpg');
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

</head>
<body>
 <a href="Index1.html"><font size="4" color="#00FF00">Back to login page!</font></a>

<script type="text/javascript">  
function matchpassword(){   
	var firstpassword=document.f1.Password.value;  
	var secondpassword=document.f1.Password2.value;  
	var phonecheck=document.f1.Phone.value;
	
	if(phonecheck.length<10 || phonecheck.length>10){
		alert("Give a valid phone number!");
		return false;
	}
	
	else if(firstpassword==secondpassword){  
		return true;  
	}  
	else{  
		alert("password must be same!");  
		return false;  
	}  
}  
</script>  

 <form name="f1" action="Register"  onsubmit="return matchpassword()" method="POST" >
 <p align="center">
  <b><font size="5">Hey User!</font></b>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </p>
 <p align="center">
  &nbsp;<b><font></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
  </p>
  <div align="center">
    <table border="0">
      <tr>
        <td width="23%"><b>UserName :&nbsp;</b></td>
        <td width="77%">	
            <b>
  			<input type="text" name="UserName" size="20" tabindex="1" required>
            </b>
        </td>
      </tr>
      <tr>
        <td width="23%">
            <b>
            Password:&nbsp;</b></td>
        <td width="77%"><b><input type="password" name="Password" size="20" tabindex="2" required>
          </b>
        </td>
      </tr>
      <tr>
        <td width="23%">
            <b>
            Confirm Password :&nbsp;</b>
        </td>
        <td width="77%"><b><input type="password" name="Password2" size="20" tabindex="3" required>
          </b>
        </td>
      </tr>
      <tr>
        <td width="23%">
            <b>
            Name :&nbsp;</b></td>
        <td width="77%">
            <b><input type="text" name="Name" size="20" tabindex="4" required>
            </b>
        </td>
      </tr>

      <tr>
        <td width="23%" height="25"><b>CAddress1 :&nbsp;&nbsp;&nbsp;</b></td>
        <td width="77%" height="25"><b><input type="text" name="CAddress1" size="43" tabindex="5" required> </b> </td>
      </tr>
      <tr>
        <td width="23%" height="25"><b>Address2(Optional):&nbsp;&nbsp;</b></td>
        <td width="77%" height="25"><b><input type="text" name="CAddress2" size="43" tabindex="6"> </b> </td>
      </tr>
      <tr>
        <td width="23%" height="25"><b>City :&nbsp;&nbsp;</b></td>
        <td width="77%" height="25"><b><select size="1" name="City" tabindex="7" required> 
         <option selected value="Select City">Select City</option>
            <option>Bhubaneswar</option>
            <option>Paralakhemundi</option>
       </select></b> </td>
      </tr>
      <tr>
        <td width="23%" height="25"><b>State :&nbsp;</b></td>
        <td width="77%" height="25"><b><select size="1" name="State" tabindex="8" required>
            <option selected value="Select State">Select State</option>
            <option>Odisha</option>
          </select> </b> </td>
      </tr>
      <tr>
        <td width="23%" height="25"><b>Pin Code :&nbsp;&nbsp;</b></td>
        <td width="77%" height="25"><b><input type="number" name="PinCode" tabindex="9" required> </b> </td>
      </tr>
      <tr>
        <td width="23%" height="25"><b>Email ID :&nbsp;</b></td>
        <td width="77%" height="25"><b><input type="email" name="Email" tabindex="10" required> </b> </td>
      </tr>
      <tr>
        <td width="23%" height="25"><b>Phone Number :&nbsp;</b></td>
        <td width="77%" height="25"><b><input type="number" name="Phone" tabindex="11" required> </b> </td>
      </tr>
      <tr>
        <td width="23%" height="1"></td>
        <td width="77%" height="1"> </td>
      </tr>
      <tr>
        <td width="23%" height="21"></td>
        <td width="77%" height="21"> 
   <b> 
   <input type="submit" value="Submit"  tabindex="12">
   </b>
 </td>
      </tr>
    </table>
    
  </div>
  
</form>
</body>
</html>