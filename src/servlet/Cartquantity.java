package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean5;
import dao.UserDao2;

/**
 * Servlet implementation class Cartquantity
 */
@WebServlet("/Cartquantity")
public class Cartquantity extends HttpServlet {
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
		
		HttpSession mysession=request.getSession();
		String username=(String)mysession.getAttribute("username");
		if(username!=null) {
			UserDao2 ud2o=new UserDao2();
			
			//UserBean5 udo=new UserBean5();
						
			List<UserBean5> odlist=ud2o.order(username);
			request.setAttribute("odlist", odlist);
			request.getRequestDispatcher("Order.jsp").forward(request, response);
		}
	}

}
