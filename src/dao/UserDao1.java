/*Connection with the database to the registration of the new user*/
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.ResultSet;

import bean.UserBean1;

public class UserDao1 {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3333/loveubuy","root","vicky@1997"); 
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public String register(UserBean1 ub1) 
	{
		Connection con;
		
		String UserName=ub1.getUserName();
		String Password=ub1.getPassword();
		String Name=ub1.getName();
		String CAddress1=ub1.getCAddress1();
		String Address2=ub1.getAddress2();
		String City=ub1.getCity();
		String State=ub1.getState();
		int PinCode=ub1.getPinCode();
		String Email=ub1.getEmail();
		String Phone=ub1.getPhone();

		int flag=0;
		
		try
		{
			con=getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM user_profile where username=?" );
	        ps.setString(1,UserName);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				flag=1;
				return "Exist!";
			}
			else if(flag==0)
			{
				try {
					
					con = getConnection();
					
					
					PreparedStatement ps1=con.prepareStatement("INSERT INTO user_auth values(?,?)");
					ps1.setString(1,UserName);
					ps1.setString(2,Password);

					PreparedStatement stat=con.prepareStatement("INSERT INTO user_profile(UserName,Password,Name,CAddress1,Address2,City,State,Pincode,Email,Phone)values(?,?,?,?,?,?,?,?,?,?)");
					stat.setString(1,UserName);
					stat.setString(2,Password);
					stat.setString(3,Name);
					stat.setString(4,CAddress1);
					stat.setString(5,Address2);
					stat.setString(6,City);
					stat.setString(7,State);
					stat.setInt(8,PinCode);
					stat.setString(9,Email);
					stat.setString(10,Phone);

					stat.executeUpdate(); 
		                       
		            int result= ps1.executeUpdate(); 
					if(result != 0) {
						return "Registered!";
					}
						
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				return "Something is wrong there!";
			}
		  
			}catch(Exception E)
		{
				E.printStackTrace();
			}
		return "Something is wrong there!";
		}
		
	
}


