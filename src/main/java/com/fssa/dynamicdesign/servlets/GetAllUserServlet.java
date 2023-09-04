package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.User;

/**
 * Servlet implementation class GetAllUserServlet
 */
@WebServlet("/GetAllUserServlet")
public class GetAllUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<User> users = new ArrayList<> ();

		users.add(new User ("bharath@fssa.freshworks.com","Bharath","password@123","9876543215","user"));
		users.add(new User ("navee@fssa.freshworks.com","Navee","Navee@123","9876543215","user"));
		users.add(new User ("maha@fssa.freshworks.com","Maha","Mahalak@123","9876543215","user"));

	
		// TODO set the list of users in the request scope and create a display_all_users.jsp file 
		// to print the details in HTML Tabular format. DO NOT print the passwords
		
		
		PrintWriter out = response.getWriter();
		out.println("User Lists");
		
		request.setAttribute("users",users);
		RequestDispatcher dispatcher = request.getRequestDispatcher("getAllUser.jsp");
        dispatcher.forward(request, response);
	}

}