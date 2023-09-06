package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class sdgsg
 */
@WebServlet("/architect_register")
public class ArchitectRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form parameters
		String profileImage = request.getParameter("profileImage");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phoneNumber = request.getParameter("number");
		String address = request.getParameter("address");
		String coverPhoto = request.getParameter("coverPhoto");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String education = request.getParameter("education");
		int experience = Integer.parseInt(request.getParameter("experience"));
		String degreeCertificatePhoto = request.getParameter("degreeCertificatePhoto");
		String nataCertificatePhoto = request.getParameter("nataCertificatePhoto");

		PrintWriter out = response.getWriter();
		ArchitectService architectService = new ArchitectService();

		// Create a sample valid architect
		// ********************** Important ******************
		// change ArchitectID , Email , Architect Name
		// ***************************************************
		Architect architect = new Architect(profileImage, name, gender, phoneNumber, address, coverPhoto, email,
				password, education, experience, degreeCertificatePhoto, nataCertificatePhoto);
		try {
			architectService.registerArchitect(architect);
			out.println("<h1>Successfully registered</h1>");
			response.sendRedirect("architect_login.jsp");
		} catch (ServiceException e) {
			// out.println("<h1>" + e.getMessage() + "</h1>");
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("architect_register.jsp?error="+error[1]);
			out.print(e.getMessage());
		}
	}
}
