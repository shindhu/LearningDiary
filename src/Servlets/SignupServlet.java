package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Domain.Users;
import Managers.UsersManager;


@WebServlet({ "/SignupServlet", "/signup" })
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/MyDB")
	DataSource ds;

	public SignupServlet() {
		super();
		
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String url = "/WEB-INF/signup.jsp";

		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String url = "/WEB-INF/signup.jsp";
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verify_password = request.getParameter("verify_password");
		String email = request.getParameter("email");

		if (!password.equals(verify_password)) {
			request.setAttribute("error", "Passwords did not match. Please Try again!");
			url = "/WEB-INF/signup.jsp";
			getServletContext().getRequestDispatcher(url).forward(request,response);
			return;

		} else {

			try {
				Users newUser = new Users(username, verify_password, email);
				UsersManager um = new UsersManager(ds);

				if (um.addUser(newUser)) {

					request.getSession().setAttribute("isLoggedIn", true);
					request.getSession().setAttribute("username", username);
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("user_id", newUser.getId());
					request.getSession().setAttribute("capName", newUser.getCapitalizedUsername());
					//request.setAttribute("user_id", newUser.get);
					request.setAttribute("id", newUser.getId());
					//request.setAttribute("capName", newUser.getCapitalizedUsername());
					request.setAttribute("email", email);
					getServletContext().getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
				} else {
					request.setAttribute("error_username","sorry already have the same username. Try with different name.");
					getServletContext().getRequestDispatcher(url).forward(request, response);
					return;
				}
			} catch (SQLException e) {
				url = "/WEB-INF/dberror.jsp";
				getServletContext().getRequestDispatcher(url).forward(request,
						response);
				return;
			}

			// response.sendRedirect(request.getContextPath() + "/addcategory");

		}

	}

}
