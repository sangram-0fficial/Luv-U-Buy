
 /* Connecting to the database for the authentication purpose */
package dao;
import java.sql.*;

public class UserDao {
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
	public static boolean validate(String username,String pass) {
		Connection con=getConnection();
		boolean status=false;
		try {
		PreparedStatement pst=con.prepareStatement("select * from user_auth where username=? and pass=?");
		pst.setString(1, username);
		pst.setString(2,pass);
		ResultSet rss=pst.executeQuery();
		while(rss.next()) {
			
			if(status=true)
		{
			
			
			rss.getString("username");
			rss.getString("pass");
		}	
	}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
