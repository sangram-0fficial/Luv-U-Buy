package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao2;
import bean.UserBean1;
/**
 * Servlet implementation class Thankyou
 */
@WebServlet("/Thankyou")
public class Thankyou extends HttpServlet {
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
		String email=(String)mysession.getAttribute("Email");
		if(username!=null && email!=null) {
			UserDao2 udd=new UserDao2();
			String thankful=udd.thanku(username);
			if(thankful.equals("Thank You!")) {
				Mailpracticebygmailserver1.send("bm2loves@gmail.com","vicky@1997",email,"Great Choice!","Your product will be reached to you by 7days");
				request.getRequestDispatcher("Thankful.jsp").forward(request, response);
			}
			else {
				request.setAttribute("thankful", thankful);
				request.getRequestDispatcher("Payment.jsp").forward(request, response);
			}
		}
		
		
	}

}
