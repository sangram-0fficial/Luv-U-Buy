package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao1;
import bean.UserBean1;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
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
		String UserName=request.getParameter("UserName");
		String Password=request.getParameter("Password");
		String Password2=request.getParameter("Password2");
		String Name=request.getParameter("Name");
		String CAddress1=request.getParameter("CAddress1");
		String Address2=request.getParameter("Address2");
		String City=request.getParameter("City");
		String State=request.getParameter("State");
		int PinCode=Integer.valueOf(request.getParameter("PinCode"));
		String Email=request.getParameter("Email");
		
		String Phone=request.getParameter("Phone");
		
		UserBean1 ub1 = new UserBean1();
		ub1.setUserName(UserName);
		ub1.setPassword(Password);
		ub1.setPassword2(Password2);
		ub1.setName(Name);
		ub1.setCAddress1(CAddress1);
		ub1.setAddress2(Address2);
		ub1.setCity(City);
		ub1.setState(State);
		ub1.setPinCode(PinCode);
		ub1.setEmail(Email);
		ub1.setPhone(Phone);
	//	Mailpracticebygmailserver1.send("bm2loves@gmail.com","vicky@1997",ub1.getEmail(),"Welcome to Love u Buy","Gentleman! You have successfully logged in! Enjoy the service.");
		UserDao1 ud1=new UserDao1();
		String userregister=ud1.register(ub1);
		if(userregister.equals("Registered!")) 
		{
			Mailpracticebygmailserver1.send("bm2loves@gmail.com","vicky@1997",ub1.getEmail(),"Welcome to Love u Buy","Gentleman! You have successfully Registered! Enjoy the service.");
			request.getRequestDispatcher("Finalogin.html").forward(request, response);
		}
			else if(userregister.equals("Exist!")) {
				request.getRequestDispatcher("NewUser.jsp").forward(request, response);
			}
		 else {
			request.setAttribute("error message", userregister);
			request.getRequestDispatcher("NewUser.jsp").forward(request, response);
		}
	}

}
