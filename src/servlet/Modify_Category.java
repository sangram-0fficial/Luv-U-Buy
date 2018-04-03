package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean4;
import dao.UserDao2;

/**
 * Servlet implementation class Modify_Category
 */
@WebServlet("/Modify_Category")
public class Modify_Category extends HttpServlet {
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
		int CategoryId;
		String CategoryName;
		
		CategoryId=Integer.parseInt(request.getParameter("CategoryId"));
		CategoryName=request.getParameter("CategoryName");
		
		UserBean4 ub5m=new UserBean4();
		
		ub5m.setCategoryId(CategoryId);
		ub5m.setCategoryname(CategoryName);
		
		UserDao2 ud5m=new UserDao2();
		
		String adminmofyctgy=ud5m.modifycategory(ub5m);
		if(adminmofyctgy.equals("Category Modified!")) {
			request.getRequestDispatcher("Categorymodified.jsp").forward(request, response);
		}
		else {
			request.setAttribute("Error Message!", adminmofyctgy);
			request.getRequestDispatcher("update_category.jsp").forward(request, response);
		}
	}
	
}
