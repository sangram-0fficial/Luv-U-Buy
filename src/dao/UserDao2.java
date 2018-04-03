/*Connection with the database for the addition of the book details,category and modification of the book details and category.
 *(All administrative operations)*/
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Ordertable;
import bean.UserBean1;
import bean.UserBean2;
import bean.UserBean3;
import bean.UserBean4;
import bean.UserBean5;
import bean.UserBean6;

public class UserDao2 {
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
	public String addbook (UserBean2 ub2) {
		Connection con;
	
		int int_BOOKID,int_PRICE,int_QUANTITY;
		String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION,str_CATEGORYID;
		
 		int_BOOKID=(int)(10000*Math.random()+1);
 		str_CATEGORYID=ub2.getstr_CATEGORYID();
 		str_TITLE=ub2.getStr_TITLE();
 		str_AUTHOR=ub2.getStr_AUTHOR();
 		str_PUBLISHER=ub2.getStr_PUBLISHER();
 		str_EDITION=ub2.getStr_EDITION();
 		int_PRICE=ub2.getInt_PRICE();
 		int_QUANTITY=ub2.getInt_QUANTITY();
 		str_DESCRIPTION=ub2.getStr_DESCRIPTION();
 		
 		try {
 		con=getConnection();
 		
 		PreparedStatement stat=con.prepareStatement("insert into book_details(BookId,CategoryId,Title,Author,Publisher,Edition,Price,Quantity,Description)values(?,?,?,?,?,?,?,?,?)");
		stat.setInt(1,int_BOOKID);
		stat.setString(2,str_CATEGORYID);
		stat.setString(3,str_TITLE);
		stat.setString(4,str_AUTHOR);		
		stat.setString(5,str_PUBLISHER);
		stat.setString(6,str_EDITION);
		stat.setInt(7,int_PRICE);
		stat.setInt(8,int_QUANTITY);
		stat.setString(9,str_DESCRIPTION);
		
		int rs=stat.executeUpdate();
 		if(rs!=0) {
 			return "Book added!";
 		}
	}catch(Exception e) {
 		e.printStackTrace();
   }
 		return "Sorry! Try Again!";
}
	public String modify(UserBean2 ub3) {
		Connection con;
	
		int int_PRICE,int_QUANTITY,int_BOOKID;
		String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION,str_CATEGORYID;
		
		int_BOOKID=ub3.getInt_BOOKID();
 		str_CATEGORYID=ub3.getstr_CATEGORYID();
 		str_TITLE=ub3.getStr_TITLE();
 		str_AUTHOR=ub3.getStr_AUTHOR();
 		str_PUBLISHER=ub3.getStr_PUBLISHER();
 		str_EDITION=ub3.getStr_EDITION();
 		int_PRICE=ub3.getInt_PRICE();
 		int_QUANTITY=ub3.getInt_QUANTITY();
 		str_DESCRIPTION=ub3.getStr_DESCRIPTION();
 		
 		try {
 		con=getConnection();
 		System.out.println("hey jambu");
 		PreparedStatement stat=con.prepareStatement("update book_details set CategoryId=?,Title=?,Author=?,Publisher=?,Edition=?,Price=?,Quantity=?,Description=? where BookId=?");
 		
		stat.setString(1,str_CATEGORYID);
		stat.setString(2,str_TITLE);
		stat.setString(3,str_AUTHOR);		
		stat.setString(4,str_PUBLISHER);
		stat.setString(5,str_EDITION);
		stat.setInt(6,int_PRICE);
		stat.setInt(7,int_QUANTITY);
		stat.setString(8,str_DESCRIPTION);
		stat.setInt(9,int_BOOKID);
		
		int rs1=stat.executeUpdate();
 		if(rs1!=0) {
 			return "Book modified!";
 		}
	}catch(Exception e) {
 		e.printStackTrace();
   }
 		return "Sorry! Try Again!";
}
	public String addcategory (UserBean3 ub4c) {
		Connection con;
		
		String CategoryId;
		int CategoryName;
		
		CategoryId=ub4c.getCategoryId();
		CategoryName=ub4c.getCategoryName();
		
		try {
			con=getConnection();
			 PreparedStatement pstmt=con.prepareStatement("insert into categorydetails(CategoryId,CategoryName)values(?,?)");
			 
			 pstmt.setString(2,CategoryId);
			 pstmt.setInt(1,CategoryName);
			 
			 int result=pstmt.executeUpdate();
			 if(result!=0) {
				 return "Category Added!";
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Sorry! Try Again!";
	}
	
	public String modifycategory (UserBean4 ub5m) {
		Connection con;
		
		int CategoryId;
		String CategoryName;
		
		CategoryId=ub5m.getCategoryId();
		CategoryName=ub5m.getCategoryname();
		
		try {
			con=getConnection();
			 PreparedStatement pstmt1=con.prepareStatement("update categorydetails set CategoryName=? where CategoryId=?");
			 
			 pstmt1.setInt(2,CategoryId);
			 pstmt1.setString(1,CategoryName);
			 
			 int result1=pstmt1.executeUpdate();
			 if(result1!=0) {
				 return "Category Modified!";
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Sorry! Try Again!";
	} 
	public List<UserBean5> search(UserBean6 ub6) {
		Connection con;
		List<UserBean5> productList = new ArrayList<UserBean5>();
		String str_searchvar;
		String tab_var;
		String str_colvar;
		
		str_searchvar=ub6.getStr_searchvar();
		tab_var=ub6.getTab_var();
		str_colvar=ub6.getStr_colvar();
		
		try {
			con=getConnection();
			
			PreparedStatement pst=con.prepareStatement("select a.* from "+tab_var+" a, categorydetails b where a."+str_colvar+" = ? and a.CategoryId = b.CategoryId");
			pst.setString(1,str_searchvar);
			ResultSet rs = pst.executeQuery();
		
			while(rs.next()) {
					UserBean5 bean = new UserBean5();
					System.out.println("Get inside!");
					bean.setInt_BOOKID(rs.getInt(1));
					bean.setInt_CATEGORYID(rs.getInt(2));
					bean.setStr_TITLE(rs.getString(3));
					bean.setStr_AUTHOR(rs.getString(4));
					bean.setStr_PUBLISHER(rs.getString(5));
					bean.setStr_EDITION(rs.getString(6));
					bean.setInt_PRICE(rs.getInt(7));
					bean.setInt_QUANTITY(rs.getInt(8));
					bean.setStr_DESCRIPTION(rs.getString(9));
					
					
					productList.add(bean);
					
				}
		}catch(Exception e) {
			e.printStackTrace();
	}
		return productList;
	}
	public List<UserBean5> show(UserBean5 ub5t, String username){
		Connection con;
		System.out.println(username);
		List<UserBean5> clist=new ArrayList<UserBean5>();
		/*
		Addtotemp ADD=new Addtotemp();
		ADD.getInitParameter(UserId);*/
		int int_BOOKID=ub5t.getInt_BOOKID();
		PreparedStatement ps;
		try {
			con=getConnection();
			//Don't write this type of code company will kick you out ! Remember 
			ps=con.prepareStatement("SELECT * FROM  book_details where BookId=?");
			ps.setInt(1,int_BOOKID);
			ResultSet rst=ps.executeQuery();
			String bookId=null,categoryid=null,title=null,author=null,publisher=null,edition=null,description=null;
			int price=0,quantity=0;
			while(rst.next())
			{
				bookId=rst.getString(1);
				categoryid=rst.getString(2);
				title=rst.getString(3);
				author=rst.getString(4);
				publisher=rst.getString(5);
				edition=rst.getString(6);
				price=rst.getInt(7);
				quantity=rst.getInt(8);
				description=rst.getString(9);
			}
			ps=con.prepareStatement("insert into temp_details VALUES(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,bookId);
			ps.setString(2,categoryid);
			ps.setString(3,title);
			ps.setString(4,author);
			ps.setString(5,publisher);
			ps.setString(6,edition);
			ps.setInt(7,price);
			ps.setInt(8,quantity);
			ps.setString(9,description);
			ps.setString(10,username);
			ps.executeUpdate();
			
			clist = fetchCartByUserId(username);
				
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return clist;
	}
	public  List<UserBean5> fetchCartByUserId(String username) {
		List<UserBean5> clist=null;
		Connection con=null;
		try {
			con=getConnection();
		PreparedStatement pstc=con.prepareStatement("select * from temp_details where UserId=?");
		pstc.setString(1, username);
		ResultSet rs=pstc.executeQuery();
		clist=new ArrayList<>();
		while(rs.next()) {
			UserBean5 ub5=new UserBean5();
			
			//System.out.println("I'm Here!");
			
			ub5.setInt_BOOKID(rs.getInt(1));
			ub5.setInt_CATEGORYID(rs.getInt(2));
			ub5.setStr_TITLE(rs.getString(3));
			ub5.setStr_AUTHOR(rs.getString(4));
			ub5.setStr_PUBLISHER(rs.getString(5));
			ub5.setStr_EDITION(rs.getString(6));
			ub5.setInt_PRICE(rs.getInt(7));
			ub5.setInt_QUANTITY(rs.getInt(8));
			ub5.setStr_DESCRIPTION(rs.getString(9));
			
			clist.add(ub5);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return clist;
	}
	public List<UserBean5> order(String username){
		Connection con;
		List<UserBean5> odlist=new ArrayList<UserBean5>();
		
		try {
			con=getConnection();
			PreparedStatement pso=con.prepareStatement("select * from temp_details where UserId=?");
			pso.setString(1, username);
			ResultSet rs=pso.executeQuery();
			while(rs.next()) {
				UserBean5 ud=new UserBean5();
				ud.setInt_BOOKID(rs.getInt(1));
				ud.setInt_CATEGORYID(rs.getInt(2));
				ud.setStr_TITLE(rs.getString(3));
				ud.setStr_AUTHOR(rs.getString(4));
				ud.setStr_PUBLISHER(rs.getString(5));
				ud.setStr_EDITION(rs.getString(6));
				ud.setInt_PRICE(rs.getInt(7));
				ud.setInt_QUANTITY(rs.getInt(8));
				ud.setStr_DESCRIPTION(rs.getString(9));
				odlist.add(ud);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return odlist;
	}
	public String itemdelete(UserBean5 ub5td,String username){
		Connection con;
		
		int int_BOOKID=ub5td.getInt_BOOKID();

		try {
			con=getConnection();
			PreparedStatement psd=con.prepareStatement("delete from temp_details where BookId=?");
			psd.setInt(1, int_BOOKID);
			int result=psd.executeUpdate();
			if(result!=0) {
				return "Removed!";
			}
			}catch(Exception e) {
				e.printStackTrace();			
		}
		return "Sorry! Try Again!";
	}
	public String thanku(String username) {
		Connection con;
		try {
			con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from temp_details where UserId=?");
			ps.setString(1, username);
			int result=ps.executeUpdate();
			if(result!=0) {
				return "Thank You!";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Sorry! Try Again!";
	}
	public String odtable(Ordertable odt,String username) {
		Connection con;
		int OrderId=(int)(10000*Math.random()+1);
		String Title=odt.getTitle();
		try {
			con=getConnection();

			PreparedStatement psto=con.prepareStatement("insert into order_details values(?,?,?)");
			psto.setString(1, username);
			psto.setInt(2, OrderId);
			psto.setString(3, Title);
			
			int rjt=psto.executeUpdate();
			if(rjt!=0) {
				return "Tracked!";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Sorry! Please Try Again!";
	}
	public String getEmail(UserBean1 ubE,String username) {
		Connection con;
		username=ubE.getUserName();
		String email=null;
		try {
			con=getConnection();
			
			PreparedStatement pse=con.prepareStatement("select Email from user_profile where UserName=?");
			pse.setString(1, username);
			ResultSet rse=pse.executeQuery();
			while(rse.next()) {
				email=rse.getString("Email");
			}
			return email;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public String autosearch(UserBean6 ub6,String Bname) {
		Connection con;
		Bname=ub6.getBname();
		try {
			con=getConnection();
			PreparedStatement pas=con.prepareStatement("select * from book_details where name like '"+Bname+"%'");
			ResultSet ras=pas.executeQuery();
			while(ras.next()) {
				//Write the rest of the code for autosearch
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Sorry!Try Again";
	}
	
}

