package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet({ "/LogoutServlet", "/logout" })
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//SAM'S LOGOUT CODE
		 HttpSession session = request.getSession();
		session.setAttribute("isLoggedIn", false);
		session.invalidate();
		
		getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		return;
		
		/*request.getSession().removeAttribute("isLoggedIn");
		response.sendRedirect("/");*/
			
	}

	
}
