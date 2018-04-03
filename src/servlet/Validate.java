package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean1;
import dao.UserDao;
import dao.UserDao2;
 
/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username,pass,email;
		username = request.getParameter("username");
		pass = request.getParameter("pass");
		//email=request.getParameter("Email");
		
		UserBean1 ubE =new UserBean1();
		ubE.setUserName(username);
		
		UserDao2 ude=new UserDao2();
		String getMailhere=ude.getEmail(ubE, username);
	//	while(getMailhere.equals("Get Email!")) {
		
		if(UserDao.validate(username, pass)) {
			if(username.equals("ajit")) {
					HttpSession mysession=request.getSession();
					mysession.setAttribute("username", username);
					mysession.setAttribute("Email", getMailhere);
					System.out.println("--"+mysession.getAttribute("Email"));
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			}
			else 
			{
				request.getRequestDispatcher("Hey_Buddy.jsp").forward(request, response);
				HttpSession mysession=request.getSession();
				mysession.setAttribute("username", username);
				mysession.setAttribute("Email", getMailhere);
				System.out.println("--"+mysession.getAttribute("Email"));
			}
		}else {
			request.setAttribute("Error Message!", UserDao.validate(username, pass));
			request.getRequestDispatcher("Finalogin.html").include(request, response);
		}
	}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
