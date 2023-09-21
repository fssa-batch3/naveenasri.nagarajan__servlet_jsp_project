package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.UserService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		PrintWriter out = response.getWriter();
		if (email == null || "".equals(email)) {
			String error = "check your email";
			request.setAttribute("email", email);

			RequestDispatcher patcher = request.getRequestDispatcher("user_login.jsp?error="+error);
			patcher.forward(request, response);
		}

		else if (password == null || "".equals(password) || password.length() < 8) {
			String error = "check your Password";
			request.setAttribute("password",password);

			RequestDispatcher patcher = request.getRequestDispatcher("user_login.jsp?error="+error);
			patcher.forward(request, response);
		} else {
			UserService userService = new UserService();
			try {
				// Check if the user login is successful using the service method
				if (userService.loginUser(user, email)) {
					// If login is successful, set the email in the session
					HttpSession session = request.getSession();
					 session.setAttribute("loggedInEmail", email);

					user = userService.getUserByEmail(email);
					session.setAttribute("user", user);

					// Redirect to the desired page (e.g., home.html)
					response.sendRedirect("user_home.jsp");
				} else {
					String error = "check your email and password.";
					request.setAttribute("email", email);
					request.setAttribute("password",password);
				
					
					RequestDispatcher patcher = request.getRequestDispatcher("user_login.jsp?error="+error);
					patcher.forward(request, response);
				}

			} catch (ServiceException e) {
				String msg = e.getMessage();
				String[] error = msg.split(":");
				request.setAttribute("email", email);
				request.setAttribute("password",password);
				
				RequestDispatcher patcher = request.getRequestDispatcher("user_login.jsp?error="+error[error.length-1]);
				patcher.forward(request, response);
				// out.print(e.getMessage());
				// response.sendRedirect("user_login.jsp?error="+e.getMessage());
			//	out.println("Error: " + e.getMessage());
			}
		}

	}

}