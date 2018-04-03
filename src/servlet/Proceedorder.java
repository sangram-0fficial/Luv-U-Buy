package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Ordertable;
import dao.UserDao2;

/**
 * Servlet implementation class Proceedorder
 */
@WebServlet("/Proceedorder")
public class Proceedorder extends HttpServlet {
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
			
			int OrderId=(int)(1000*Math.random()+1);
			String Title=request.getParameter("Title");
			
			Ordertable odt=new Ordertable();
			
			odt.setOrderId(OrderId);
			odt.setTitle(Title);
			
		    UserDao2 ud2=new UserDao2();
		    String order=ud2.odtable(odt, username);
		    if(order.equals("Tracked!")) {
		    	request.getRequestDispatcher("Payment.jsp").forward(request, response);
		    }
		   
		}
	}

	

}
