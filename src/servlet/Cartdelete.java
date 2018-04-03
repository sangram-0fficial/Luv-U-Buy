package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean5;
import dao.UserDao2;

/**
 * Servlet implementation class Cartdelete
 */
@WebServlet("/Cartdelete")
public class Cartdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession mysession=request.getSession(false);
		String username=(String)mysession.getAttribute("username");
		
		if(username!=null) {
			System.out.println("username is:"+username);
			UserDao2 ud2d=new UserDao2();
		
		    int Int_BOOKID=Integer.parseInt(request.getParameter("BookId"));
		
		    UserBean5 ub5td=new UserBean5();
		 
		    ub5td.setInt_BOOKID(Int_BOOKID);
		
		    String clistd=ud2d.itemdelete(ub5td, username);
		    request.setAttribute("clistd", clistd);
		    request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}
		
	}

}

 