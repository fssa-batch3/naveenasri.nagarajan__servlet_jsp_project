package com.fssa.dynamicdesign.servlets;


import java.io.IOException;

import java.io.PrintWriter;

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
       
	    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		 PrintWriter out = response.getWriter();
		if(email == null || "".equals(email)) {
			out.println("Invalid Email");
			response.sendRedirect("login.jsp?errorMessage=Invalid Email");
		}
		
		else if(password == null || "".equals(password) || password.length() < 6) {
			response.sendRedirect("login.jsp?errorMessage=Invalid Password");	

			// response.sendRedirect("login.html");	
		}
		else {
			out.println("Email and password is valid");
			 UserService userService = new UserService();
			try {
	            // Check if the user login is successful using the service method
	            if (userService.loginUser(user,email)) {
	                // If login is successful, set the email in the session
	                HttpSession session = request.getSession();
	                session.setAttribute("loggedInEmail", email);

	                // Redirect to the desired page (e.g., home.html)
	                response.sendRedirect("user_home.jsp");
	            } else {
	                out.println("Login failed. Please check your email and password.");
	            }

	        } catch (ServiceException e) {
	            out.println("Error: " + e.getMessage());
	        }
		}
		
	}

}