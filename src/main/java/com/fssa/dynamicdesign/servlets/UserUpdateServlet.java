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
			 out.println("<h1>Successfully Updated the user</h1>");
		}catch (ServiceException e) {
	           out.println("<h1>"+e.getMessage()+"</h1>");
	        }
	}

}