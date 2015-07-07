package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Domain.Category;
import Managers.CategoryManager;

@WebServlet({ "/CategoryServlet", "/category" })
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/MyDB")
	DataSource ds;

	public CategoryServlet() {
		super();

	}

	boolean loggedIn(HttpSession session) {
		Boolean loggedInBoolean = (Boolean) session.getAttribute("isLoggedIn");

		if (loggedInBoolean != null) {
			return loggedInBoolean.booleanValue();
		} else {
			return false;
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (loggedIn(session)) {
			request.setAttribute("categoryList", categoryTotals(session));
			//request.setAttribute("categories", category(session));
			request.getRequestDispatcher("/WEB-INF/viewcategory.jsp").forward(request,response);
		} else {
			response.sendRedirect("/LearningDiary/login");			
		}	
	}

	private List<Category> categoryTotals(HttpSession session)
			throws ServletException, IOException 
	{
		int user_id = (Integer) session.getAttribute("user_id");
		try {
			CategoryManager cm = new CategoryManager(ds);
			
			return  cm.getCategoryTotals(user_id);			
		} catch (SQLException e) {
			e.printStackTrace();
            // maybe go to error page
			return null;
		}

	}
	
	/*private List<Category> category(HttpSession session)
			throws ServletException, IOException 
	{
		int user_id = (Integer) session.getAttribute("user_id");
		try {
			CategoryManager cm = new CategoryManager(ds);
			return cm.getCategory(user_id);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
			
		}
	}*/
	
	
}
