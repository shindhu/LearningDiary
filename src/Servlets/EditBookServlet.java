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

import Domain.Books;
import Domain.Category;
import Exceptions.DBErrorException;
import Managers.BooksManager;
import Managers.CategoryManager;

@WebServlet({ "/EditBookServlet", "/editBook" })
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/MyDB")
	DataSource ds;
	
    public EditBookServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/WEB-INF/index.jsp";
		Books bookToEdit = null;
		BooksManager bm = new BooksManager(ds);
		int id = new Integer(request.getParameter("id"));
		ArrayList<Category> categoryList = new ArrayList<>();
		CategoryManager cm = new CategoryManager(ds);
		
		HttpSession session = request.getSession();
		int user_id = (Integer) session.getAttribute("user_id");
		try {
			bookToEdit =  bm.getBookWithBookID(id, user_id);
			//System.out.println(bookToEdit.getClass());
			categoryList = cm.getCategory(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
			url = "/WEB-INF/dberror.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			return;
			
		}
		if (bookToEdit != null) {
			request.setAttribute("book", bookToEdit);
			System.out.println("Book to Edit is: "+bookToEdit);
			request.setAttribute("categories", categoryList);
			url = "/WEB-INF/editbook.jsp";
		}
		getServletContext().getRequestDispatcher(url).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 //  String url= request.getContextPath() + "/booksByCategory";
	   boolean updateSuccedded = false;
	   HttpSession session = request.getSession();
	   
	  
	   	int user_id = (Integer) session.getAttribute("user_id");
		int id= new Integer(request.getParameter("id"));
		int category_id = new Integer(request.getParameter("category_id"));
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String book_format = request.getParameter("book_format");
		String notes = request.getParameter("notes");
		
		Books updatedBook = new Books(id, user_id, category_id, image, name, book_format, notes);
		BooksManager bm = new BooksManager(ds);
		
		try {
				updateSuccedded = bm.updateBook(updatedBook);
				System.out.println(updateSuccedded);
				
		} catch (DBErrorException | SQLException e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher("/LearningDiary/dberror.jsp").forward(request, response);
			return;
		}
		
		if(updateSuccedded != true) {
			request.setAttribute("error_update", "Book didn't update in the database! Try again");
			String url = "/WEB-INF/editBook?id" + id;
			request.setAttribute("id", id);
			request.setAttribute("category_id", category_id);
			request.setAttribute("image", image);
			request.setAttribute("name", name);
			request.setAttribute("book_format", book_format);
			request.setAttribute("notes", notes);
			
			getServletContext().getRequestDispatcher(url).forward(request, response);
			return;
			
		} 
		String url="/LearningDiary/booksByCategory?category_id="+category_id;
		response.sendRedirect(url);
		
	}

}
		
		