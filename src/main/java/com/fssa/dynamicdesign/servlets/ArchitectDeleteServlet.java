package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/deleteArchitect")
public class ArchitectDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        // Set the response content type to HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        
        ArchitectService architectService = new ArchitectService();
        
        try {
            boolean deleted = architectService.deleteArchitect(email);
            if (deleted) {
                out.println("<h1>Architect account successfully deleted.</h1>");
        		HttpSession session = request.getSession(false);
    			session.removeAttribute("loggedInEmail");
    			session.invalidate();
        		response.sendRedirect("index.jsp");
            } else {
                out.println("<h1>Failed to delete architect account. Invalid email or password.</h1>");
            }
        } catch (ServiceException e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        }
        
        out.println("</body></html>");
    }
}
