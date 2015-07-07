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

import Domain.Users;
import Managers.UsersManager;


@WebServlet({ "/UsersServlet", "/users" })
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/MyDB")
	DataSource ds;
	   
    public UsersServlet() {
        super();
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/WEB-INF/viewusers.jsp";
		UsersManager um = new UsersManager(ds);
		ArrayList<Users> theUsers = null;
	
		HttpSession session = request.getSession();
		Boolean loggedInBoolean = (Boolean) session.getAttribute("isLoggedIn");
		
		if(loggedInBoolean != null) {
			Boolean loggedIn = loggedInBoolean.booleanValue();
			if(loggedIn) {
				String username = (String) session.getAttribute("username");
					try {
						if(username.matches("admin")) {
							theUsers = um.getUserBooksCount();
							System.out.println(theUsers);
							
						} else {
							url = "/WEB-INF/index.jsp";
							//request.setAttribute("Users_access_error", "You dont have access");
							System.out.println("You don't have access");
						}
						
					} catch(SQLException e) {
						url = "/WEB-INF/dberror.jsp";
						getServletContext().getRequestDispatcher(url).forward(request, response);
						return;
						
					}
			}
		}
		
		if(theUsers != null) {
			url = "/WEB-INF/viewusers.jsp";
			request.setAttribute("user", theUsers);
		}
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}
}
