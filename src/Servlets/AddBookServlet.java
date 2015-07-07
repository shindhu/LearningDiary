package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.derby.client.am.SqlException;

import Domain.Category;
import Managers.BooksManager;
import Managers.CategoryManager;


@WebServlet({ "/AddBookServlet", "/addBook" })
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/MyDB")
	DataSource ds;
	
    public AddBookServlet() {
        super();
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Category> categoryList = new ArrayList<>();
		CategoryManager cm = new CategoryManager(ds);
		HttpSession session = request.getSession();
		int user_id = (Integer) session.getAttribute("user_id");
		try {
			
			categoryList = cm.getCategory(user_id);
			request.setAttribute("categories", categoryList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/WEB-INF/addbook.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getContextPath() + "/books";
		boolean addedBook = false;
		HttpSession session = request.getSession();
		
		int user_id = (Integer) session.getAttribute("user_id");
		int category_id = new Integer( request.getParameter("category_id"));
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String book_format = request.getParameter("book_format");
		String notes = request.getParameter("notes");
		
		try {
			addedBook = new BooksManager(ds).addBook(user_id, category_id, image, name, book_format, notes);
			request.setAttribute("category_id", category_id);
		} catch(SqlException e) {
			e.printStackTrace();
		}
		
		if(addedBook != true) {
			request.setAttribute("error", "database failed to update the book");
			url = "/WEB-INF/addBook";
			request.setAttribute("category_id", category_id);
			request.setAttribute("image", image);
			request.setAttribute("name", name);
			request.setAttribute("book_format", book_format);
			request.setAttribute("notes", notes);
			
			getServletContext().getRequestDispatcher(url).forward(request, response);
			return;
			
		}
		
		response.sendRedirect(url);
		
	}

}
