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

@WebServlet("/user_register")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        UserService userService = new UserService();
        
        User user1 = new User(email, userName, password, phoneNumber, type);
        try {
            userService.registerUser(user1);
            out.println("<h1>Successfully registered</h1>");
    		response.sendRedirect("user_login.jsp");
        } catch (ServiceException e) {
            // out.println("<h1>" + e.getMessage() + "</h1>");
            //response.sendRedirect("user_register.jsp?error="+e.getMessage());
        	
        	String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("user_register.jsp?error="+error[1]);
			out.print(e.getMessage());
        }
    }
}
