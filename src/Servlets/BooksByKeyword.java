package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import Domain.Books;
import Managers.BooksManager;

@WebServlet({ "/BooksByKeyword", "/booksByKeyword" })
public class BooksByKeyword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/MyDB")
	DataSource ds;
		
	public BooksByKeyword() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="/WEB-INF/booksbykeyword.jsp";
		HttpSession session = request.getSession();
		BooksManager bm = new BooksManager(ds);
		List<Books> searchBooks = null;
		String filteredBooks;
		String theName = request.getParameter("name");
		//String theNotes = request.getParameter("notes");
		
		try {
			filteredBooks = request.getParameter("search");
			if(filteredBooks != null && filteredBooks.equals("name"))
			{
				searchBooks = bm.findBooksByTitle(theName);
			} else {
				searchBooks = bm.findBooksByNotes(theName);
			}
			
				
			System.out.println("Filtered Books are: "+ searchBooks);
		} catch (SQLException e) {
			e.printStackTrace();
			url="/LearningDiary/books";
		}
		
		if(searchBooks != null) {
			request.setAttribute("theFilteredBook", searchBooks);
		} /*else {
			request.setAttribute("Empty_filteredBooks", "OOOPs can't find....");
		}*/
		
		if(searchBooks.isEmpty()) {
			request.setAttribute("Empty_filteredBooks", "OOOPs you dont have any book called.."+theName);
		}
		getServletContext().getRequestDispatcher(url).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
