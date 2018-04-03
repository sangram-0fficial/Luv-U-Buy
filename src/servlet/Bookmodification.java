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
 * Servlet implementation class Bookmodification
 */
@WebServlet("/Bookmodification")
public class Bookmodification extends HttpServlet {
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
		int int_PRICE,int_QUANTITY,int_BOOKID;
		String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION,str_CATEGORYID;
		
		int_BOOKID=Integer.parseInt(request.getParameter("BookId"));
 		str_CATEGORYID=request.getParameter("CategoryId");
 		str_TITLE=request.getParameter("Title");
 		str_AUTHOR=request.getParameter("Author");
 		str_PUBLISHER=request.getParameter("Publisher");
 		str_EDITION=request.getParameter("Edition");
 		int_PRICE=Integer.parseInt(request.getParameter("Price"));
 		int_QUANTITY=Integer.parseInt(request.getParameter("Quantity"));
 		str_DESCRIPTION=request.getParameter("Description");
 		
 		UserBean2 ub3=new UserBean2();
 		
 		ub3.setInt_BOOKID(int_BOOKID);
 		ub3.setstr_CATEGORYID(str_CATEGORYID);
 		ub3.setStr_TITLE(str_TITLE);
 		ub3.setStr_AUTHOR(str_AUTHOR);
 		ub3.setStr_PUBLISHER(str_PUBLISHER);
 		ub3.setStr_EDITION(str_EDITION);
 		ub3.setInt_PRICE(int_PRICE);
 		ub3.setInt_QUANTITY(int_QUANTITY);
 		ub3.setStr_DESCRIPTION(str_DESCRIPTION);
 		
 		UserDao2 ud3 =new UserDao2();
 		String adminmodify=ud3.modify(ub3);
 		if(adminmodify.equals("Book modified!")) {
 			request.getRequestDispatcher("Bookmodified.jsp").forward(request, response);
 		}
 		else {
 			request.setAttribute("Error Message!", adminmodify);
 			request.getRequestDispatcher("modify.jsp").forward(request, response);
 		}
	}
}
