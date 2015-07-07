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

import Domain.Category;
import Managers.CategoryManager;


@WebServlet({ "/EditCategoryServlet", "/editCategory" })
public class EditCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/MyDB")
	DataSource ds;
	   
        public EditCategoryServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url = "/WEB-INF/index.jsp";
		
		CategoryManager cm = new CategoryManager(ds);
		Category category = null;
		int id = new Integer(request.getParameter("id"));
		HttpSession session = request.getSession();
		int user_id = (Integer) session.getAttribute("user_id");
		try {
			category = cm.getCategoryByID(id, user_id);
			
		} catch (SQLException e) {
			e.printStackTrace();
			url = "/WEB-INF/dberror.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			return;
			
		}
		if (category != null) {
			request.setAttribute("category", category);
			url = "/WEB-INF/editcategory.jsp";
			
		}
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//HttpSession session = request.getSession();
		String url = request.getContextPath() + "/category";
		boolean updateSucceeded = false;
		
		int id = new Integer(request.getParameter("id"));
		String name = request.getParameter("name");
		System.out.println("id = "+id + "name = "+name);
		Category c = new Category(id,name);
		
		CategoryManager cm = new CategoryManager(ds);
		try {
			updateSucceeded = cm.updateCategory(c);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		if(updateSucceeded != true) {
			request.setAttribute("error", "Category didn't update! Try again.");
			url = "/WEB-INF/editCategory?id=" + id;
			request.setAttribute("id", id);
			request.setAttribute("name", name);
		
			getServletContext().getRequestDispatcher(url).forward(request, response);
			return;
		}
		response.sendRedirect(url);
		//getServletContext().getRequestDispatcher(url).forward(request, response);
		
	}

}
