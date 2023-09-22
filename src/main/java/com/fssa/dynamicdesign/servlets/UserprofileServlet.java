package com.fssa.dynamicdesign.servlets;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.UserService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/UserprofileServlet")
public class UserprofileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	User user = (User) session.getAttribute("user");
    	String email  = user.getEmail();
    
        UserService userService = new UserService();
       // Initialize the user object
        User userdetails = null;
        try {
        	session = request.getSession(false);
            request.setAttribute("user", email);
        	userdetails = userService.getUserByEmail(email);
        		
    			session.setAttribute("user", userdetails);
        } catch (ServiceException e) {
            // Handle the exception properly, you can log it or set an error message
            e.printStackTrace();
            request.setAttribute("error", "Error fetching user data.");
        }

        request.getRequestDispatcher("/user_profile.jsp").forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle any POST requests if needed
    }
}
