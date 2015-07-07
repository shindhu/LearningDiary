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
import Managers.BooksManager;
import Managers.CategoryManager;


@WebServlet({ "/DeleteBookServlet", "/deleteBook" })
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/MyDB")
	DataSource ds;
   
    public DeleteBookServlet() {
        super();
       
    }
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
	}*/
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    //	String url = request.getContextPath() + "/books";
    	boolean updateSucceeded = false;
    	String url = "/WEB-INF/index.jsp";
    	int id = new Integer(request.getParameter("id"));
    	
    	HttpSession session = request.getSession();
    	int user_id = (Integer) session.getAttribute("user_id");
    	int category_id = new Integer(request.getParameter("category_id"));
    	//System.out.println("Category_id="+category_id);
    	try {
    		updateSucceeded = new BooksManager(ds).deleteBookWithID(id, user_id);
    		System.out.println("Deleted book: "+updateSucceeded);
    		
    		url="/LearningDiary/booksByCategory?category_id="+category_id;
    		response.sendRedirect(url);
    		return;
    		
    	} catch(SQLException e) {
    		e.printStackTrace();
    		getServletContext().getRequestDispatcher("/LearningDiary/dberror.jsp").forward(request, response);
    		
    	}
    	
    	if(updateSucceeded != true) {
    		request.setAttribute("error_delete", "Delete of databse record failed");
    		url = "WEB-INF/booksByCategory";
    		getServletContext().getRequestDispatcher(url).forward(request, response);
    		
    	}
    	
    	getServletContext().getRequestDispatcher(url).forward(request, response);
    	
	}

}
