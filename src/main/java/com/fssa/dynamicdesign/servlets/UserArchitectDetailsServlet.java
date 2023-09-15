package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/userArchitectDetailsServlet")
public class UserArchitectDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        // Forward the request to the architect details JSP
        request.getRequestDispatcher("/user_architect_details.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle any POST requests if needed
    }
}
