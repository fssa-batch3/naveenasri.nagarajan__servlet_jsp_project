package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Architect; // Make sure to import the correct Architect model
import com.fssa.dynamicdesign.service.ArchitectService; // Make sure to import the correct ArchitectService
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/architect_login")
public class ArchitectLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Architect architect = new Architect(email, password); // Assuming you have an Architect class

        PrintWriter out = response.getWriter();

        if (email == null || "".equals(email)) {
            response.sendRedirect("architect_login.jsp?errorMessage=Invalid Email");
        } else if (password == null || "".equals(password) || password.length() < 6) {
            response.sendRedirect("architect_login.jsp?errorMessage=Invalid Password");
        } else {
            ArchitectService architectService = new ArchitectService(); // Assuming you have an ArchitectService class
            try {
                // Check if the architect login is successful using the service method
                if (architectService.loginArchitect(architect, email)) {
                    // If login is successful, set the email in the session
                    HttpSession session = request.getSession();
                    session.setAttribute("loggedInEmail", email);
                    // You can also set the user type in the session, e.g., "architect"
                    session.setAttribute("userType", "architect");

                    // Redirect to the desired page for architects (e.g., architect_dashboard.jsp)
                    response.sendRedirect("architect_home.jsp");
                } else {
                    out.println("Login failed. Please check your email and password.");
                }
            } catch (ServiceException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
}
