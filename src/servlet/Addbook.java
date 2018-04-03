package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.UserBean2;
import dao.UserDao2;
/**
 * Servlet implementation class Addbook
 */
@WebServlet("/Addbook")
public class Addbook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int int_BOOKID,int_PRICE,int_QUANTITY;
		String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION,str_CATEGORYID;
		
 		int_BOOKID=(int)(10000*Math.random()+1);
 		str_CATEGORYID=request.getParameter("CategoryName");
 		str_TITLE=request.getParameter("Title");
 		str_AUTHOR=request.getParameter("Author");
 		str_PUBLISHER=request.getParameter("Publisher");
 		str_EDITION=request.getParameter("Edition");
 		int_PRICE=Integer.parseInt(request.getParameter("Price"));
 		int_QUANTITY=Integer.parseInt(request.getParameter("Quantity"));
 		str_DESCRIPTION=request.getParameter("Description");
 		
 		UserBean2 ub2=new UserBean2();
 		
 		ub2.setInt_BOOKID(int_BOOKID);
 		ub2.setstr_CATEGORYID(str_CATEGORYID);
 		ub2.setStr_TITLE(str_TITLE);
 		ub2.setStr_AUTHOR(str_AUTHOR);
 		ub2.setStr_PUBLISHER(str_PUBLISHER);
 		ub2.setStr_EDITION(str_EDITION);
 		ub2.setInt_PRICE(int_PRICE);
 		ub2.setInt_QUANTITY(int_QUANTITY);
 		ub2.setStr_DESCRIPTION(str_DESCRIPTION);
 		
 		UserDao2 ud2 =new UserDao2();
 		String adminbookadd=ud2.addbook(ub2);
 		if(adminbookadd.equals("Book added!")) {
 			request.getRequestDispatcher("Bookadded.jsp").forward(request, response);
 		}
 		else {
 			request.setAttribute("Error Message!", adminbookadd);
 			request.getRequestDispatcher("insert.jsp").forward(request, response);
 		}
 
	}

}
