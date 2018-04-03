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
 * Servlet implementation class Addtotemp
 */
@WebServlet("/Addtotemp")
public class Addtotemp extends HttpServlet {
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
		
		HttpSession mysession=request.getSession(false);
		String username=(String)mysession.getAttribute("username");
		
		if(username!=null) {
			System.out.println("username is:"+username);
			UserDao2 ud2c=new UserDao2();
		//Addtotemp ADD=new Addtotemp();
		//ADD.getInitParameter(UserId);
		int Int_BOOKID=Integer.parseInt(request.getParameter("BookId"));
		
		UserBean5 ub5t=new UserBean5();
		 
		ub5t.setInt_BOOKID(Int_BOOKID);
		
		List<UserBean5> clist=ud2c.show(ub5t,username);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}
		}
	
	}


