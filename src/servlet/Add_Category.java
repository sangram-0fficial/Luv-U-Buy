package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean3;
import dao.UserDao2;

/**
 * Servlet implementation class Add_Category
 */
@WebServlet("/Add_Category")
public class Add_Category extends HttpServlet {
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
		String CategoryId;
		int CategoryName;
		
		CategoryId=request.getParameter("CategoryId");
		CategoryName=(int)(1000*Math.random()+1);
				
		
		UserBean3 ub4c=new UserBean3();
		 
		ub4c.setCategoryId(CategoryId);
		ub4c.setCategoryName(CategoryName);
		
		UserDao2 ud4c=new UserDao2();
		String addctgy=ud4c.addcategory(ub4c);
		if(addctgy.equals("Category Added!")) {
			request.getRequestDispatcher("categoryadded.jsp").forward(request, response);
		}
		else {
			request.setAttribute("Errot Message!", addctgy);
			request.getRequestDispatcher("insert_category.jsp").forward(request, response);
		}
	}

}
