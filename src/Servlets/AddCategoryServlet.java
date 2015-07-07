package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Managers.CategoryManager;

@WebServlet({ "/AddCategoryServlet", "/addCategory" })
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@Resource(name="jdbc/MyDB")
	DataSource ds;
	
    public AddCategoryServlet() {
        super();
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/WEB-INF/addcategory.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = request.getContextPath() + "/category";
		boolean addedCategory = false;
		HttpSession session = request.getSession();
		int user_id = (Integer) session.getAttribute("user_id");
		String name = request.getParameter("name");
		
		try {
			addedCategory = new CategoryManager(ds).addCategory(user_id, name);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		if (addedCategory != true) {
			request.setAttribute("error", "database failed to add the category");
			url = "/category?user_id="+user_id;
			request.setAttribute("name", name);
			request.setAttribute("user_id", user_id);
			getServletContext().getRequestDispatcher(url).forward(request, response);
			return;
			
			
		}
		response.sendRedirect(url);
		
	}

}
