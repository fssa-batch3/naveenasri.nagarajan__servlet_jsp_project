package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.UserService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/deleteUser")
public class UserDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		HttpSession session = request.getSession(false);
		if(session != null) {
		User user = (User) session.getAttribute("user");
    	String email  = user.getEmail();
		
     //   String email = request.getParameter("email");        
        // Set the response content type to HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        
        UserService userService = new UserService();
        
        try {
            boolean deleted = userService.deleteUser(email);
            if (deleted) {
                out.println("<h1>Account successfully deleted.</h1>");
        	//	HttpSession session = request.getSession(false);
        	//	User user = (User) session.getAttribute("user");
        		//String email  = user.getEmail();
    			 session.removeAttribute("user");
    			session.invalidate();
        		response.sendRedirect("index.jsp");
            } else {
                out.println("<h1>Failed to delete account. Invalid email or password.</h1>");
            }
        } catch (ServiceException e) {
            response.sendRedirect("user_delete.jsp?error="+e.getMessage());
        }
        
        out.println("</body></html>");
		}else {
			System.out.println("session invalid in the user delete page you wants to login again");
			response.sendRedirect("user_login.jsp");
		}
    }
}
