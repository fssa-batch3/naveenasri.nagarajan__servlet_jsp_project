package com.fssa.dynamicdesign.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/DeleteDesignServlet")
public class DeleteDesignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the uniqueId parameter from the request
        long uniqueId = Long.parseLong(request.getParameter("uniqueId"));

        // Set the response content type to HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        
        // Create a DesignService instance
        DesignService designService = new DesignService();

        try {
            // Attempt to delete the design
            boolean deleted = designService.deleteDesign(uniqueId,null);

            if (deleted) {
                out.println("<h1>Design successfully deleted.</h1>");

                response.sendRedirect("architectdesignlistservlet"); // Redirect to the design list page
            } else {
                response.getWriter().write("Design with UniqueID " + uniqueId + " was not found or deletion failed.");
            }
        } catch (ServiceException e) {
        	// Handle database error
            e.printStackTrace();
            response.getWriter().write("An error occurred while deleting the design.");
        }
    }
}
