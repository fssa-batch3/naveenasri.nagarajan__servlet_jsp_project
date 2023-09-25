package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/ArchitectProfileServlet")
public class ArchitectProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null) {
			// Retrieve the architect's email from the request parameter
			String email = request.getParameter("email");

			// For example, you can retrieve architect data from a service
			ArchitectService architectService = new ArchitectService();
			Architect architect = null; // Initialize the architect object

			try {
				architect = architectService.getArchitectByEmail(email);
			} catch (ServiceException e) {
				// Handle the exception properly, you can log it or set an error message
				e.printStackTrace();
				request.setAttribute("error", "Error fetching architect data.");
			}

			// Set architect data as an attribute to be used in the JSP
			request.setAttribute("architect", architect);

			// Forward the request to the architect profile JSP
			request.getRequestDispatcher("/architect_profile.jsp").forward(request, response);
		} else {
			System.out.println("session invalid in the architect profile page you wants to login again");
			response.sendRedirect("architect_login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handle any POST requests if needed
	}
}
