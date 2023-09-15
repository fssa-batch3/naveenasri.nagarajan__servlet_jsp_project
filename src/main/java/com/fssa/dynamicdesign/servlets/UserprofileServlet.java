package com.fssa.dynamicdesign.servlets;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.UserService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/UserprofileServlet")
public class UserprofileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You can put any necessary logic here to retrieve user data based on the email parameter
        String email = request.getParameter("email");

        // For example, you can retrieve user data from a service
        UserService userService = new UserService();
        User user = null; // Initialize the user object

        try {
            user = userService.getUserByEmail(email);
        } catch (ServiceException e) {
            // Handle the exception properly, you can log it or set an error message
            e.printStackTrace();
            request.setAttribute("error", "Error fetching user data.");
        }

        // Set user data as an attribute to be used in the JSP
        request.setAttribute("user", user);

        // Forward the request to the user profile JSP
        request.getRequestDispatcher("/user_profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle any POST requests if needed
    }
}
