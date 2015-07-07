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

import Domain.Users;
import Managers.UsersManager;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/MyDB")
	DataSource ds;

	public LoginServlet() {
		super();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET LOGIN!");
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request,
				response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("POST LOGIN");

		String url = "/WEB-INF/login.jsp";
		String action = request.getParameter("action");
		//UsersManager um = new UsersManager(ds);
		//ArrayList<Users> usersList = null;

		if (("login").equalsIgnoreCase(action)) {

			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Users theFoundUser = null;
			try {
				theFoundUser = new UsersManager(ds)
						.findUserWithNameAndPassword(username, password);

			} catch (SQLException e) {
				url = "/dberror.jsp";
				getServletContext().getRequestDispatcher(url).forward(request,
						response);

			}

			if (theFoundUser != null) {

				request.setAttribute("user", theFoundUser);

				HttpSession session = request.getSession();
				session.setAttribute("isLoggedIn", true);
				session.setAttribute("capName",
						theFoundUser.getCapitalizedUsername());
				session.setAttribute("user_id", theFoundUser.getId());
				session.setAttribute("username", theFoundUser.getUsername());
				request.setAttribute("email", theFoundUser.getEmail());

				System.out.println("username = " + theFoundUser.getUsername());

				if (theFoundUser.getUsername().matches("admin")) {

					url = "/WEB-INF/viewusers.jsp";
					response.sendRedirect("/LearningDiary/users");
					return;
				} else {
					url = "/WEB-INF/category.jsp";
					response.sendRedirect("/LearningDiary/category?user_id="
							+ theFoundUser.getId());
					return;
				}

			} else {
				request.setAttribute("error",
						"The username or password was incorrect! ");
				url = "/WEB-INF/login.jsp";
			}
		}

		getServletContext().getRequestDispatcher(url)
				.forward(request, response);
	}

}
