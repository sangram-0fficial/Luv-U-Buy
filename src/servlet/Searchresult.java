package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean5;
import bean.UserBean6;
import dao.UserDao2;

/**
 * Servlet implementation class Searchresult
 */
@WebServlet("/Searchresult")
public class Searchresult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String str_searchvar=null;
			String str_colvar=null;
			
			
			HttpSession mysession=request.getSession(false);
			String tab_var="";
			String username=(String)mysession.getAttribute("username");
			System.out.println("0");	
			
			String Bname=request.getParameter("val");
			str_searchvar=request.getParameter(str_searchvar);
			str_colvar=request.getParameter(str_colvar);
			tab_var=request.getParameter(tab_var);
		
			if (username!=null)
		   	{
				if(request.getParameter("R1").equals("Title"))
				{
					str_searchvar=request.getParameter("BookTitle");
					str_colvar="TITLE";
				}
				if(request.getParameter("R1").equals("CategoryId"))	
				{
					str_searchvar=request.getParameter("BookCategory");
					str_colvar="CategoryId";
				}
				if(request.getParameter("R1").equals("Publisher"))	
				{
					str_searchvar=request.getParameter("BookPublisher");
					str_colvar="Publisher";
				}
				if(request.getParameter("R1").equals("Author"))
				{
					str_searchvar=request.getParameter("BookAuthor");
					str_colvar="Author";
				}		
				if (request.getParameter("R2")==null)
				{
					tab_var="book_details";		
				}
				else
				{
				// to get the name of the table in which the search to be done-------
					if (request.getParameter("R2").equals("A"))
					{
						tab_var="temp_details";
					}
					else
					{
						tab_var="book_details";
					}
				}

		   	}
			UserBean6 ub6=new UserBean6();
			
			ub6.setStr_colvar(str_colvar);
			ub6.setStr_searchvar(str_searchvar);
			ub6.setTab_var(tab_var);
			ub6.setBname(Bname);
			
			UserDao2 ud2=new UserDao2();
			
			List<UserBean5> productList=ud2.search(ub6);
			request.setAttribute("productList", productList);
			RequestDispatcher rsd = request.getRequestDispatcher("Search.jsp");
			rsd.forward(request, response);
			
			
}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}