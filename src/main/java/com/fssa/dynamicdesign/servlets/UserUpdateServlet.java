package com.fssa.dynamicdesign.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.UserService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String userName = request.getParameter("name");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String type = request.getParameter("type");
		PrintWriter out = response.getWriter();
	
		out.println("Update User");

		UserService userService = new UserService();
		// check the userID , give valid details
		 User user1 = new User( email,userName,password,phoneNumber,type);
		try {
			userService.updateUser(user1, email);
			// out.println("Successfully Updated the user");
			 response.sendRedirect("user_design_list.jsp");
		}catch (ServiceException e) {
	        	String msg = e.getMessage();
				String[] error = msg.split(":");
				response.sendRedirect("user_update.jsp?error="+error[1]+"&email="+email);
				out.print(e.getMessage());
	        }
	}

}